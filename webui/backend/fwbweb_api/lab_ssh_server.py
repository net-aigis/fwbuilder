"""Ephemeral Paramiko SSH/SFTP lab for multi-vendor expect + password deploy proof.

Emulates IOS / Junos / Procurve shells and accepts SFTP puts (in-memory).
Used by tests and `webui/scripts/e2e-lab-ssh.sh` — not a production daemon.
"""

from __future__ import annotations

import os
import socket
import threading
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import paramiko
from paramiko import SFTPAttributes, SFTPHandle, SFTPServer, SFTPServerInterface


# platform -> prompt set
_PLATFORM_PROMPTS: dict[str, dict[str, bytes]] = {
    "ios": {"user": b"router>", "enable": b"router#", "config": b"router(config)#"},
    "iosacl": {"user": b"router>", "enable": b"router#", "config": b"router(config)#"},
    "pix": {"user": b"cisco>", "enable": b"cisco#", "config": b"cisco(config)#"},
    "asa": {"user": b"ciscoasa>", "enable": b"ciscoasa#", "config": b"ciscoasa(config)#"},
    "junos": {"user": b"user@host>", "enable": b"user@host>", "config": b"user@host#"},
    "junosacl": {"user": b"user@host>", "enable": b"user@host>", "config": b"user@host#"},
    "procurve": {"user": b"ProCurve>", "enable": b"ProCurve#", "config": b"ProCurve(config)#"},
    "procurveacl": {"user": b"ProCurve>", "enable": b"ProCurve#", "config": b"ProCurve(config)#"},
}


class _Server(paramiko.ServerInterface):
    def __init__(self, username: str, password: str) -> None:
        self.username = username
        self.password = password
        self.event = threading.Event()

    def check_channel_request(self, kind: str, chanid: int) -> int:
        if kind in {"session", "direct-tcpip"}:
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username: str, password: str) -> int:
        if username == self.username and password == self.password:
            return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def check_auth_publickey(self, username: str, key: paramiko.PKey) -> int:
        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username: str) -> str:
        return "password"

    def check_channel_shell_request(self, channel: paramiko.Channel) -> bool:
        self.event.set()
        return True

    def check_channel_pty_request(
        self,
        channel: paramiko.Channel,
        term: str,
        width: int,
        height: int,
        pixelwidth: int,
        pixelheight: int,
        modes: bytes,
    ) -> bool:
        return True

    def check_channel_exec_request(self, channel: paramiko.Channel, command: bytes) -> bool:
        # Accept activation / decompress commands used by password deploy.
        # Run I/O in a thread so the request handler returns promptly.
        def _exec_reply() -> None:
            try:
                time.sleep(0.02)
                channel.sendall(b"ok\n")
                channel.shutdown_write()
                channel.send_exit_status(0)
            except Exception:
                try:
                    channel.close()
                except Exception:
                    pass

        threading.Thread(target=_exec_reply, daemon=True).start()
        return True

    # Do NOT override check_channel_subsystem_request — the default starts the
    # registered SFTPServer handler via Transport.set_subsystem_handler.


class _MemSFTPHandle(SFTPHandle):
    def __init__(self, flags: int, store: dict[str, bytes], path: str) -> None:
        super().__init__(flags)
        self._store = store
        self._path = path
        self._buf = bytearray(store.get(path, b""))
        self._offset = 0

    def write(self, offset: int, data: bytes) -> int:  # type: ignore[override]
        end = offset + len(data)
        if end > len(self._buf):
            self._buf.extend(b"\x00" * (end - len(self._buf)))
        self._buf[offset:end] = data
        self._store[self._path] = bytes(self._buf)
        return paramiko.SFTP_OK

    def read(self, offset: int, length: int) -> bytes:  # type: ignore[override]
        data = bytes(self._buf[offset : offset + length])
        return data

    def stat(self) -> SFTPAttributes:  # type: ignore[override]
        attr = SFTPAttributes()
        attr.st_size = len(self._buf)
        attr.st_mode = 0o100644
        return attr

    def close(self) -> None:
        self._store[self._path] = bytes(self._buf)
        super().close()


class _MemSFTPServer(SFTPServerInterface):
    ROOT = "/tmp/fwbweb-lab"

    def __init__(self, server: Any, *args: Any, store: dict[str, bytes] | None = None, **kwargs: Any) -> None:
        super().__init__(server, *args, **kwargs)
        self._store = store if store is not None else {}

    def _norm(self, path: str) -> str:
        p = path if path.startswith("/") else f"{self.ROOT}/{path}"
        return os.path.normpath(p)

    def list_folder(self, path: str) -> list[SFTPAttributes] | int:  # type: ignore[override]
        return []

    def stat(self, path: str) -> SFTPAttributes | int:  # type: ignore[override]
        n = self._norm(path)
        if n in self._store or n.endswith("/") or n == self.ROOT:
            attr = SFTPAttributes()
            attr.filename = os.path.basename(n) or "/"
            attr.st_mode = 0o040755 if n == self.ROOT or n.endswith("/") else 0o100644
            attr.st_size = len(self._store.get(n, b""))
            return attr
        return paramiko.SFTP_NO_SUCH_FILE

    def lstat(self, path: str) -> SFTPAttributes | int:  # type: ignore[override]
        return self.stat(path)

    def open(self, path: str, flags: int, attr: SFTPAttributes | None) -> SFTPHandle | int:  # type: ignore[override]
        n = self._norm(path)
        return _MemSFTPHandle(flags, self._store, n)

    def remove(self, path: str) -> int:  # type: ignore[override]
        self._store.pop(self._norm(path), None)
        return paramiko.SFTP_OK

    def rename(self, oldpath: str, newpath: str) -> int:  # type: ignore[override]
        data = self._store.pop(self._norm(oldpath), None)
        if data is None:
            return paramiko.SFTP_NO_SUCH_FILE
        self._store[self._norm(newpath)] = data
        return paramiko.SFTP_OK

    def mkdir(self, path: str, attr: SFTPAttributes) -> int:  # type: ignore[override]
        return paramiko.SFTP_OK

    def rmdir(self, path: str) -> int:  # type: ignore[override]
        return paramiko.SFTP_OK

    def chattr(self, path: str, attr: SFTPAttributes) -> int:  # type: ignore[override]
        return paramiko.SFTP_OK

    def canonicalize(self, path: str) -> str:  # type: ignore[override]
        return self._norm(path)


def _shell_loop(chan: paramiko.Channel, platform: str, enable_password: str | None) -> None:
    """Interactive shell approximating vendor CLI for expect runtime."""
    key = platform.lower().strip() or "ios"
    prompts = _PLATFORM_PROMPTS.get(key)
    if prompts is None:
        for fam in ("junos", "procurve", "pix", "asa", "ios"):
            if fam in key:
                prompts = _PLATFORM_PROMPTS[fam]
                break
    if prompts is None:
        prompts = _PLATFORM_PROMPTS["ios"]

    is_junos = "junos" in key
    mode = "user"
    chan.sendall(b"Welcome to emulated " + key.encode() + b"\n" + prompts["user"])
    buf = b""
    while True:
        try:
            chunk = chan.recv(1024)
        except Exception:
            break
        if not chunk:
            break
        buf += chunk
        while b"\n" in buf or b"\r" in buf:
            line, sep, rest = buf.partition(b"\n")
            if not sep:
                line, sep, rest = buf.partition(b"\r")
            buf = rest
            cmd = line.decode("utf-8", errors="replace").strip()
            low = cmd.lower()
            if low in {"enable", "en"}:
                if enable_password:
                    chan.sendall(b"\nPassword: ")
                    # read password line
                    pw_buf = b""
                    while b"\n" not in pw_buf and b"\r" not in pw_buf:
                        try:
                            more = chan.recv(256)
                        except Exception:
                            return
                        if not more:
                            return
                        pw_buf += more
                    # accept any password when enable_password set (expect sends secret)
                    mode = "enable"
                else:
                    mode = "enable"
            elif is_junos and low in {"configure", "configure private", "edit"}:
                mode = "config"
            elif low in {"configure terminal", "conf t", "configure", "config"}:
                mode = "config"
            elif low in {"exit", "end", "quit"}:
                if mode == "config":
                    mode = "enable" if not is_junos else "user"
                else:
                    mode = "user"
            elif low in {
                "write memory",
                "write mem",
                "copy running-config startup-config",
                "commit",
                "commit check",
            }:
                chan.sendall(b"\n[OK]\n")
                mode = "enable" if not is_junos else "user"
            try:
                chan.sendall(b"\n" + prompts[mode if mode in prompts else "user"])
            except Exception:
                return


@dataclass
class LabSshServer:
    host: str
    port: int
    username: str
    password: str
    platform: str = "ios"
    enable_password: str | None = None
    files: dict[str, bytes] = field(default_factory=dict)
    _sock: socket.socket | None = None
    _thread: threading.Thread | None = None
    _stop: threading.Event | None = None

    def start(self) -> None:
        host_key = paramiko.RSAKey.generate(2048)
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind((self.host, self.port))
        sock.listen(8)
        sock.settimeout(0.5)
        self._sock = sock
        self.port = sock.getsockname()[1]
        stop = threading.Event()
        self._stop = stop
        platform = self.platform
        enable_password = self.enable_password
        store = self.files

        def accept_loop() -> None:
            while not stop.is_set():
                try:
                    client, _addr = sock.accept()
                except socket.timeout:
                    continue
                except OSError:
                    break
                threading.Thread(
                    target=_handle_client,
                    args=(
                        client,
                        host_key,
                        self.username,
                        self.password,
                        platform,
                        enable_password,
                        store,
                    ),
                    daemon=True,
                ).start()

        self._thread = threading.Thread(target=accept_loop, daemon=True)
        self._thread.start()

    def stop(self) -> None:
        if self._stop:
            self._stop.set()
        if self._sock:
            try:
                self._sock.close()
            except OSError:
                pass
        if self._thread:
            self._thread.join(timeout=2.0)


def _handle_client(
    client: socket.socket,
    host_key: paramiko.PKey,
    username: str,
    password: str,
    platform: str,
    enable_password: str | None,
    store: dict[str, bytes],
) -> None:
    try:
        transport = paramiko.Transport(client)
        transport.add_server_key(host_key)

        def sftp_factory(*args: Any, **kwargs: Any) -> _MemSFTPServer:
            return _MemSFTPServer(*args, store=store, **kwargs)

        transport.set_subsystem_handler("sftp", SFTPServer, sftp_factory)
        server = _Server(username, password)
        transport.start_server(server=server)
        # Password deploy uses SFTP then exec on the same transport — accept
        # multiple channels until the peer disconnects.
        idle = 0.0
        while transport.is_active() and idle < 30.0:
            chan = transport.accept(1.0)
            if chan is None:
                idle += 1.0
                continue
            idle = 0.0
            # Shell request arrives after channel open; wait briefly.
            if server.event.wait(0.5):
                server.event.clear()
                _shell_loop(chan, platform, enable_password)
                try:
                    chan.close()
                except Exception:
                    pass
            # else: SFTP subsystem / exec already handled by Paramiko callbacks
        transport.close()
    except Exception:
        try:
            client.close()
        except Exception:
            pass


def start_lab_ssh(
    *,
    username: str = "lab",
    password: str = "labpass",
    host: str = "127.0.0.1",
    port: int = 0,
    platform: str = "ios",
    enable_password: str | None = None,
) -> LabSshServer:
    """Bind an ephemeral multi-vendor lab SSH/SFTP server; caller must stop()."""
    srv = LabSshServer(
        host=host,
        port=port,
        username=username,
        password=password,
        platform=platform,
        enable_password=enable_password,
    )
    srv.start()
    deadline = time.time() + 2.0
    while time.time() < deadline and srv.port == 0:
        time.sleep(0.01)
    return srv


def lab_received_paths(srv: LabSshServer) -> list[str]:
    """Paths written via SFTP during the lab session."""
    return sorted(srv.files.keys())

"""Ephemeral Paramiko SSH server for lab/e2e proof of password + expect paths.

Not a production daemon — tests and `webui/scripts/e2e-lab-ssh.sh` only.
"""

from __future__ import annotations

import socket
import threading
import time
from dataclasses import dataclass
from typing import Callable

import paramiko


class _Server(paramiko.ServerInterface):
    def __init__(self, username: str, password: str) -> None:
        self.username = username
        self.password = password
        self.event = threading.Event()

    def check_channel_request(self, kind: str, chanid: int) -> int:
        if kind == "session":
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
        # Simple echo for scp/deploy probes that use exec.
        channel.sendall(b"ok\n")
        channel.send_exit_status(0)
        return True


def _ios_shell_loop(chan: paramiko.Channel) -> None:
    """Minimal IOS-like interactive shell for expect runtime."""
    mode = "user"
    prompts = {"user": b"router>", "enable": b"router#", "config": b"router(config)#"}
    chan.sendall(b"Welcome\n" + prompts["user"])
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
            cmd = line.decode("utf-8", errors="replace").strip().lower()
            if cmd in {"enable", "en"}:
                mode = "enable"
            elif cmd in {"configure terminal", "conf t", "configure"}:
                mode = "config"
            elif cmd in {"exit", "end"}:
                mode = "enable" if mode == "config" else "user"
            elif cmd in {"write memory", "write mem", "copy running-config startup-config"}:
                chan.sendall(b"\n[OK]\n")
                mode = "enable"
            try:
                chan.sendall(b"\n" + prompts[mode])
            except Exception:
                return


@dataclass
class LabSshServer:
    host: str
    port: int
    username: str
    password: str
    _sock: socket.socket | None = None
    _thread: threading.Thread | None = None
    _stop: threading.Event | None = None

    def start(self) -> None:
        host_key = paramiko.RSAKey.generate(2048)
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind((self.host, self.port))
        sock.listen(5)
        sock.settimeout(0.5)
        self._sock = sock
        self.port = sock.getsockname()[1]
        stop = threading.Event()
        self._stop = stop

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
                    args=(client, host_key, self.username, self.password),
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
) -> None:
    try:
        transport = paramiko.Transport(client)
        transport.add_server_key(host_key)
        server = _Server(username, password)
        transport.start_server(server=server)
        chan = transport.accept(20)
        if chan is None:
            transport.close()
            return
        server.event.wait(10)
        if chan.closed:
            transport.close()
            return
        _ios_shell_loop(chan)
        try:
            chan.close()
        except Exception:
            pass
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
) -> LabSshServer:
    """Bind an ephemeral lab SSH server; caller must stop()."""
    srv = LabSshServer(host=host, port=port, username=username, password=password)
    srv.start()
    # Wait until accept loop is listening.
    deadline = time.time() + 2.0
    while time.time() < deadline and srv.port == 0:
        time.sleep(0.01)
    return srv

"""Paramiko-based SSH for password / keyboard-interactive auth (WebUI deploy).

Secrets must never be logged or echoed into plan/command strings.
"""

from __future__ import annotations

import socket
from pathlib import Path
from typing import Any, Callable, Sequence

import paramiko


class SshSessionError(RuntimeError):
    def __init__(self, message: str, *, log: str = "") -> None:
        super().__init__(message)
        self.log = log


def _host_key_policy() -> paramiko.MissingHostKeyPolicy:
    """Mirror OpenSSH StrictHostKeyChecking=accept-new for first contact."""
    return paramiko.AutoAddPolicy()


def _auth_handler(
    password: str | None,
    kbi_responses: Sequence[str] | None,
) -> Callable[[str, str, list[str], list[bool]], list[str]]:
    responses = list(kbi_responses or [])
    pw = password or ""

    def handler(
        title: str,
        instructions: str,
        prompt_list: list[str],
        echo_list: list[bool],
    ) -> list[str]:
        out: list[str] = []
        for i, _prompt in enumerate(prompt_list):
            if i < len(responses):
                out.append(responses[i])
            elif pw:
                out.append(pw)
            else:
                out.append("")
        return out

    return handler


def connect_ssh(
    *,
    host: str,
    user: str,
    password: str | None = None,
    keyboard_interactive_responses: Sequence[str] | None = None,
    identity_file: str | None = None,
    port: int = 22,
    timeout: float = 20.0,
) -> paramiko.SSHClient:
    """Open an authenticated SSH client. Caller must close()."""
    if not host:
        raise SshSessionError("host required")
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(_host_key_policy())

    connect_kwargs: dict[str, Any] = {
        "hostname": host,
        "port": port,
        "username": user or None,
        "timeout": timeout,
        "allow_agent": not password and not keyboard_interactive_responses,
        "look_for_keys": not password and not keyboard_interactive_responses,
    }
    if identity_file:
        path = str(Path(identity_file).expanduser())
        if not Path(path).is_file():
            client.close()
            raise SshSessionError(f"SSH identity file missing: {path}")
        connect_kwargs["key_filename"] = path
        connect_kwargs["allow_agent"] = True
        connect_kwargs["look_for_keys"] = True

    use_password = bool(password)
    use_kbi = keyboard_interactive_responses is not None or use_password

    try:
        if use_password or keyboard_interactive_responses is not None:
            # Prefer password auth; fall back to keyboard-interactive.
            try:
                client.connect(
                    **connect_kwargs,
                    password=password if use_password else None,
                    auth_timeout=timeout,
                )
            except paramiko.AuthenticationException:
                if not use_kbi:
                    raise
                # Retry with explicit keyboard-interactive handler.
                transport = paramiko.Transport((host, port))
                transport.banner_timeout = timeout
                transport.auth_timeout = timeout
                try:
                    transport.start_client(timeout=timeout)
                except (paramiko.SSHException, socket.error) as exc:
                    transport.close()
                    raise SshSessionError(f"SSH transport failed: {exc}") from exc
                try:
                    transport.auth_interactive(
                        user or "",
                        _auth_handler(password, keyboard_interactive_responses),
                    )
                except paramiko.AuthenticationException as exc:
                    transport.close()
                    raise SshSessionError("SSH authentication failed") from exc
                client._transport = transport  # noqa: SLF001 — attach live transport
        else:
            client.connect(**connect_kwargs, auth_timeout=timeout)
    except SshSessionError:
        client.close()
        raise
    except paramiko.AuthenticationException as exc:
        client.close()
        raise SshSessionError("SSH authentication failed") from exc
    except (paramiko.SSHException, socket.error, OSError, TimeoutError) as exc:
        client.close()
        raise SshSessionError(f"SSH connect failed: {exc}") from exc
    return client


def probe_password_auth(
    *,
    host: str,
    user: str,
    password: str | None = None,
    keyboard_interactive_responses: Sequence[str] | None = None,
    identity_file: str | None = None,
    port: int = 22,
    timeout: float = 20.0,
) -> dict[str, Any]:
    """Authenticate and disconnect; never returns the secret."""
    client = connect_ssh(
        host=host,
        user=user,
        password=password,
        keyboard_interactive_responses=keyboard_interactive_responses,
        identity_file=identity_file,
        port=port,
        timeout=timeout,
    )
    try:
        transport = client.get_transport()
        authed = bool(transport and transport.is_authenticated())
        return {
            "ok": authed,
            "host": host,
            "user": user,
            "port": port,
            "auth": "password_or_keyboard_interactive",
            "note": "Probe connect succeeded; secret was not stored.",
        }
    finally:
        client.close()


def sftp_put(client: paramiko.SSHClient, local: Path, remote: str) -> None:
    sftp = client.open_sftp()
    try:
        sftp.put(str(local), remote)
    finally:
        sftp.close()


def ssh_exec(
    client: paramiko.SSHClient,
    command: str,
    *,
    timeout: float = 120.0,
) -> tuple[int, str]:
    _stdin, stdout, stderr = client.exec_command(command, timeout=timeout)
    out = (stdout.read() or b"").decode("utf-8", errors="replace")
    err = (stderr.read() or b"").decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    return code, out + err


def invoke_shell(client: paramiko.SSHClient) -> paramiko.Channel:
    """Interactive shell channel for expect-style installers."""
    chan = client.invoke_shell(term="vt100", width=200, height=50)
    chan.settimeout(30.0)
    return chan

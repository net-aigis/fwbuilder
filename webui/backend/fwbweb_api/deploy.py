"""Simplified policy install via system ssh/scp (not the full Qt installer)."""

from __future__ import annotations

import os
import shlex
import subprocess
from pathlib import Path
from typing import Any


class DeployError(RuntimeError):
    def __init__(self, message: str, *, log: str = "", commands: list[str] | None = None) -> None:
        super().__init__(message)
        self.log = log
        self.commands = commands or []


def _run(cmd: list[str], *, timeout: float, env: dict[str, str] | None = None) -> tuple[int, str]:
    proc = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        timeout=timeout,
        check=False,
        env=env,
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    return proc.returncode, out


def plan_and_deploy(
    *,
    local_script: Path,
    host: str,
    user: str,
    remote_dir: str,
    remote_name: str | None = None,
    activate: bool = True,
    activation_cmd: str = "",
    ssh_args: str = "",
    scp_args: str = "",
    identity_file: str | None = None,
    dry_run: bool = True,
    timeout: float = 120.0,
) -> dict[str, Any]:
    if not host:
        raise DeployError("host/management address required")
    if not local_script.is_file():
        raise DeployError(f"local script missing: {local_script}")

    remote_name = remote_name or local_script.name
    remote_path = f"{remote_dir.rstrip('/')}/{remote_name}"
    target = f"{user}@{host}" if user else host

    ssh_extra = shlex.split(ssh_args) if ssh_args.strip() else []
    scp_extra = shlex.split(scp_args) if scp_args.strip() else []
    if identity_file:
        ssh_extra += ["-i", identity_file]
        scp_extra += ["-i", identity_file]

    # Prefer BatchMode so missing keys fail fast instead of hanging on password.
    base_ssh = ["ssh", "-o", "BatchMode=yes", "-o", "StrictHostKeyChecking=accept-new", *ssh_extra]
    base_scp = ["scp", "-o", "BatchMode=yes", "-o", "StrictHostKeyChecking=accept-new", *scp_extra]

    scp_cmd = [*base_scp, str(local_script), f"{target}:{remote_path}"]
    commands = [" ".join(shlex.quote(c) for c in scp_cmd)]

    act = (activation_cmd or "").strip()
    if activate:
        if not act:
            # Same idea as GUI installer for regular users: run the copied script.
            act = f"sudo {remote_path}" if user and user != "root" else remote_path
        ssh_cmd = [*base_ssh, target, act]
        commands.append(" ".join(shlex.quote(c) for c in ssh_cmd))
    else:
        ssh_cmd = None

    result: dict[str, Any] = {
        "ok": True,
        "dry_run": dry_run,
        "host": host,
        "user": user,
        "remote_path": remote_path,
        "local_script": str(local_script),
        "activation_cmd": act if activate else "",
        "commands": commands,
        "log": "",
        "note": (
            "Simplified WebUI installer (ssh/scp). Not the full desktop "
            "FirewallInstaller / expect session."
        ),
    }

    if dry_run:
        result["log"] = "dry_run: commands not executed\n" + "\n".join(commands)
        return result

    env = {**os.environ}
    log_parts: list[str] = []
    code, out = _run(scp_cmd, timeout=timeout, env=env)
    log_parts.append(f"$ {' '.join(scp_cmd)}\n{out}")
    if code != 0:
        raise DeployError(f"scp exited {code}", log="\n".join(log_parts), commands=commands)

    if ssh_cmd is not None:
        code, out = _run(ssh_cmd, timeout=timeout, env=env)
        log_parts.append(f"$ {' '.join(ssh_cmd)}\n{out}")
        if code != 0:
            raise DeployError(f"ssh activate exited {code}", log="\n".join(log_parts), commands=commands)

    result["log"] = "\n".join(log_parts)
    return result

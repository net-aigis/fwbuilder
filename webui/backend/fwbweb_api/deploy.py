"""Simplified policy install via system ssh/scp (not the full Qt installer).

Closer to FirewallInstallerUnx for Unix/nft/ipt: reads the compiler
``# files:`` manifest and copies every listed file, then activates the
main script. Still no expect/SSHSession interactive installer.
"""

from __future__ import annotations

import os
import re
import shlex
import subprocess
from pathlib import Path
from typing import Any


class DeployError(RuntimeError):
    def __init__(self, message: str, *, log: str = "", commands: list[str] | None = None) -> None:
        super().__init__(message)
        self.log = log
        self.commands = commands or []


_MANIFEST_RE = re.compile(r"^#\s*files:\s*(.*)$", re.IGNORECASE)


def parse_fw_manifest(script: Path) -> list[dict[str, Any]]:
    """Parse Firewall Builder ``# files:`` lines from a generated script.

    Format (same as FirewallInstaller::parseManifestLine)::

        # files: * local_name [remote_name]

    ``*`` marks the main activation script.
    """
    if not script.is_file():
        return []
    entries: list[dict[str, Any]] = []
    for raw in script.read_text(encoding="utf-8", errors="replace").splitlines():
        m = _MANIFEST_RE.match(raw.strip())
        if not m:
            continue
        parts = m.group(1).split()
        if not parts:
            continue
        main = False
        if parts[0] == "*":
            main = True
            parts = parts[1:]
        if not parts:
            continue
        local = parts[0]
        remote = parts[1] if len(parts) > 1 else ""
        entries.append({"local": local, "remote": remote, "main": main})
    return entries


def _is_abs_remote(path: str) -> bool:
    return path.startswith("/") or (len(path) > 2 and path[1] == ":")


def resolve_manifest_files(
    *,
    local_script: Path,
    remote_dir: str,
    remote_name_override: str | None = None,
) -> tuple[list[tuple[Path, str]], str]:
    """Return ([(local_path, remote_path), ...], main_remote_path)."""
    base = local_script.parent
    entries = parse_fw_manifest(local_script)
    fwdir = remote_dir.rstrip("/") or "/etc"

    if not entries:
        remote = remote_name_override or local_script.name
        if not _is_abs_remote(remote):
            remote = f"{fwdir}/{remote}"
        return [(local_script, remote)], remote

    copies: list[tuple[Path, str]] = []
    main_remote = ""
    for ent in entries:
        local_name = ent["local"]
        remote_name = ent["remote"] or ""
        local_path = Path(local_name)
        if not local_path.is_absolute():
            local_path = base / local_name
        if not local_path.is_file():
            # Fall back to main script basename in destdir
            alt = base / Path(local_name).name
            if alt.is_file():
                local_path = alt
            else:
                raise DeployError(f"manifest local file missing: {local_name}")

        if remote_name_override and ent.get("main"):
            remote_name = remote_name_override

        if not remote_name:
            remote_path = f"{fwdir}/{local_path.name}"
        elif _is_abs_remote(remote_name):
            remote_path = remote_name
        else:
            remote_path = f"{fwdir}/{remote_name}"

        copies.append((local_path, remote_path))
        if ent.get("main"):
            main_remote = remote_path

    if not main_remote and copies:
        main_remote = copies[0][1]
    return copies, main_remote


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


def expand_activation_cmd(
    cmd: str,
    *,
    fwdir: str,
    fwscript: str,
    remote_path: str,
) -> str:
    """Expand FirewallInstaller-style macros in activationCmd."""
    out = cmd
    for src, dst in (
        ("{{$fwdir}}", fwdir),
        ("{{$fwscript}}", fwscript),
        ("{{$remote_script}}", remote_path),
        ("%FWDIR%", fwdir),
        ("%FWSCRIPT%", fwscript),
    ):
        out = out.replace(src, dst)
    return out


def _scp_host(host: str) -> str:
    """Bracket IPv6 literals for scp (same idea as FirewallInstaller::packSCPArgs)."""
    if ":" in host and not host.startswith("["):
        return f"[{host}]"
    return host


def plan_and_deploy(
    *,
    local_script: Path,
    host: str,
    user: str,
    remote_dir: str,
    remote_name: str | None = None,
    activate: bool = True,
    activation_cmd: str = "",
    host_os: str = "",
    firewall_name: str = "",
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

    copies, main_remote = resolve_manifest_files(
        local_script=local_script,
        remote_dir=remote_dir,
        remote_name_override=remote_name,
    )
    ssh_target = f"{user}@{host}" if user else host
    scp_target = f"{user}@{_scp_host(host)}" if user else _scp_host(host)
    fwdir = str(Path(main_remote).parent).replace("\\", "/") or remote_dir.rstrip("/") or "/etc"
    fwscript = Path(main_remote).name

    ssh_extra = shlex.split(ssh_args) if ssh_args.strip() else []
    scp_extra = shlex.split(scp_args) if scp_args.strip() else []
    if identity_file:
        ssh_extra += ["-i", identity_file]
        scp_extra += ["-i", identity_file]

    # Prefer BatchMode so missing keys fail fast instead of hanging on password.
    base_ssh = ["ssh", "-o", "BatchMode=yes", "-o", "StrictHostKeyChecking=accept-new", *ssh_extra]
    base_scp = ["scp", "-o", "BatchMode=yes", "-o", "StrictHostKeyChecking=accept-new", *scp_extra]

    scp_cmds: list[list[str]] = []
    commands: list[str] = []
    plan_lines = ["Installation plan:"]
    for local_path, remote_path in copies:
        plan_lines.append(f"Copy file: {local_path.name} --> {remote_path}")
        scp_cmd = [*base_scp, str(local_path), f"{scp_target}:{remote_path}"]
        scp_cmds.append(scp_cmd)
        commands.append(" ".join(shlex.quote(c) for c in scp_cmd))

    act = (activation_cmd or "").strip()
    activation_source: str | None = None
    if activate:
        if not act:
            from .configlets import default_activation_cmd

            conf = default_activation_cmd(
                host_os=host_os,
                user=user,
                fwdir=fwdir,
                fwscript=fwscript,
                remote_path=main_remote,
                firewall_name=firewall_name,
            )
            if conf.get("ok") and conf.get("command"):
                act = str(conf["command"])
                activation_source = conf.get("source")
            else:
                # Fallback: same idea as GUI for regular users.
                act = f"sudo {main_remote}" if user and user != "root" else main_remote
                activation_source = "fallback"
        else:
            act = expand_activation_cmd(
                act,
                fwdir=fwdir,
                fwscript=fwscript,
                remote_path=main_remote,
            )
            activation_source = "activationCmd"
        plan_lines.append(f"Activate: {act}")
        ssh_cmd = [*base_ssh, ssh_target, act]
        commands.append(" ".join(shlex.quote(c) for c in ssh_cmd))
    else:
        ssh_cmd = None
        plan_lines.append("Activate: (skipped)")

    manifest = parse_fw_manifest(local_script)
    result: dict[str, Any] = {
        "ok": True,
        "dry_run": dry_run,
        "host": host,
        "user": user,
        "remote_path": main_remote,
        "local_script": str(local_script),
        "files": [{"local": str(lp), "remote": rp} for lp, rp in copies],
        "manifest": manifest,
        "activation_cmd": act if activate else "",
        "activation_source": activation_source,
        "plan": plan_lines,
        "commands": commands,
        "log": "",
        "note": (
            "WebUI installer (ssh/scp) with FirewallInstaller-style manifest copy "
            "and OS installer configlets. Not the full desktop expect/SSHSession installer."
        ),
    }

    if dry_run:
        result["log"] = (
            "\n".join(plan_lines)
            + "\n\ndry_run: commands not executed\n"
            + "\n".join(commands)
        )
        return result

    env = {**os.environ}
    log_parts: list[str] = []
    for scp_cmd in scp_cmds:
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

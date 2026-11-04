"""Simplified policy install via system ssh/scp (not the full Qt installer).

Closer to FirewallInstallerUnx for Unix/nft/ipt: reads the compiler
``# files:`` manifest and copies every listed file, then activates the
main script. Still no expect/SSHSession interactive installer.
"""

from __future__ import annotations

import gzip
import os
import re
import shlex
import shutil
import subprocess
import tempfile
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


def _gzip_for_transfer(local_path: Path) -> Path:
    """Write a temporary gzip of ``local_path`` for compressed scp transfer."""
    fd, name = tempfile.mkstemp(prefix="fwbweb-gz-", suffix=".gz")
    os.close(fd)
    out = Path(name)
    with local_path.open("rb") as src, gzip.open(out, "wb") as dst:
        shutil.copyfileobj(src, dst)
    return out


SSH_AUTH_NOTE = (
    "WebUI uses OpenSSH BatchMode=yes (key/agent only). "
    "Password and keyboard-interactive SSH are not implemented."
)


def ssh_auth_capabilities() -> dict[str, Any]:
    """Honest SSH auth capability summary for WebUI deploy."""
    return {
        "batch_mode": True,
        "batch_mode_only": True,
        "password_supported": False,
        "keyboard_interactive_supported": False,
        "identity_file_supported": True,
        "ssh_agent_supported": True,
        "implemented": ["batch_mode", "identity_file", "ssh_agent"],
        "not_implemented": ["password", "keyboard_interactive"],
        "alternatives": ["identity_file", "ssh_agent"],
        "refusal_paths": {
            "deploy_allow_password_auth": 400,
            "ssh_auth_password": 501,
        },
        "note": SSH_AUTH_NOTE,
    }


def plan_external_install(
    *,
    command: str,
    arguments: str = "",
    fwb_path: Path,
    firewall_name: str,
    work_dir: str | None = None,
    dry_run: bool = True,
    timeout: float = 120.0,
) -> dict[str, Any]:
    """Run Management PolicyInstallScript locally (FirewallInstallerUnx path).

    Desktop skips scp/activate entirely when install_script.command is set.
    """
    cmd_path = str(Path(command).expanduser())
    extra = shlex.split(arguments) if (arguments or "").strip() else []
    argv = [cmd_path, *extra, "-f", str(fwb_path)]
    wdir = (work_dir or "").strip()
    if wdir:
        argv += ["-d", wdir]
    argv.append(firewall_name)
    plan_lines = [
        "Installation plan:",
        f"Run script {' '.join(argv)}",
    ]
    cmd_str = " ".join(shlex.quote(c) for c in argv)
    result: dict[str, Any] = {
        "ok": True,
        "dry_run": dry_run,
        "mode": "external_install_script",
        "host": "",
        "user": "",
        "remote_path": "",
        "local_script": "",
        "files": [],
        "manifest": [],
        "activation_cmd": "",
        "activation_source": "install_script",
        "identity_file": None,
        "plan": plan_lines,
        "commands": [cmd_str],
        "log": "",
        "note": (
            "Management PolicyInstallScript is set; WebUI runs it locally "
            "(same as desktop FirewallInstallerUnx when install script is configured)."
        ),
    }
    if dry_run:
        result["log"] = "\n".join(plan_lines) + "\n\ndry_run: commands not executed\n" + cmd_str
        return result
    if not Path(cmd_path).is_file() and "/" in cmd_path:
        # Absolute/relative path must exist; bare command names rely on PATH.
        raise DeployError(f"install script missing: {cmd_path}", commands=[cmd_str])
    code, out = _run(argv, timeout=timeout)
    result["log"] = f"$ {cmd_str}\n{out}"
    if code != 0:
        raise DeployError(f"install script exited {code}", log=result["log"], commands=[cmd_str])
    return result


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
    compress: bool = False,
    generate_rc_conf: bool = False,
    use_scp: bool = True,
    copy_fwb: bool = False,
    fwb_path: Path | None = None,
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
    if remote_dir and not (
        remote_dir.startswith("/")
        or (len(remote_dir) > 2 and remote_dir[1] == ":")
    ):
        raise DeployError(f"remote_dir must be absolute: {remote_dir}")

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
    identity_expanded: str | None = None
    if identity_file:
        identity_expanded = str(Path(identity_file).expanduser())
        if not dry_run and not Path(identity_expanded).is_file():
            raise DeployError(f"SSH identity file missing: {identity_expanded}")
        ssh_extra += ["-i", identity_expanded]
        scp_extra += ["-i", identity_expanded]

    # Prefer BatchMode so missing keys fail fast instead of hanging on password.
    base_ssh = [
        "ssh",
        "-o",
        "BatchMode=yes",
        "-o",
        "StrictHostKeyChecking=accept-new",
        "-o",
        "ConnectTimeout=20",
        *ssh_extra,
    ]
    base_scp = [
        "scp",
        "-o",
        "BatchMode=yes",
        "-o",
        "StrictHostKeyChecking=accept-new",
        "-o",
        "ConnectTimeout=20",
        *scp_extra,
    ]

    scp_cmds: list[list[str]] = []
    commands: list[str] = []
    plan_lines = ["Installation plan:", f"SSH auth: {SSH_AUTH_NOTE}"]
    temp_gz: list[Path] = []
    decompress_parts: list[str] = []
    transfer_copies: list[tuple[Path, str]] = []

    def _queue_copy(local_path: Path, remote_path: str, *, label: str) -> None:
        try:
            sz = local_path.stat().st_size
            size_s = f" ({sz} bytes)" if sz < 1024 else f" ({sz / 1024:.1f} KiB)"
        except OSError:
            size_s = ""
        if compress:
            gz_path = _gzip_for_transfer(local_path)
            temp_gz.append(gz_path)
            try:
                gz_sz = gz_path.stat().st_size
                gz_s = f" ({gz_sz} bytes gzip)" if gz_sz < 1024 else f" ({gz_sz / 1024:.1f} KiB gzip)"
                raw_sz = local_path.stat().st_size
                if raw_sz > 0 and gz_sz > 0:
                    ratio = 100.0 * (1.0 - gz_sz / raw_sz)
                    gz_s += f", −{ratio:.0f}%"
            except OSError:
                gz_s = " (gzip)"
            remote_gz = f"{remote_path}.gz"
            plan_lines.append(
                f"{label}: {local_path.name}{size_s} --> {remote_gz}{gz_s} "
                f"(gunzip to {remote_path})"
            )
            scp_cmd = [*base_scp, str(gz_path), f"{scp_target}:{remote_gz}"]
            transfer_copies.append((gz_path, remote_gz))
            decompress_parts.append(
                f"gzip -dc {shlex.quote(remote_gz)} > {shlex.quote(remote_path)} "
                f"&& rm -f {shlex.quote(remote_gz)}"
            )
        else:
            plan_lines.append(f"{label}: {local_path.name}{size_s} --> {remote_path}")
            scp_cmd = [*base_scp, str(local_path), f"{scp_target}:{remote_path}"]
            transfer_copies.append((local_path, remote_path))
        scp_cmds.append(scp_cmd)
        commands.append(" ".join(shlex.quote(c) for c in scp_cmd))

    for local_path, remote_path in copies:
        _queue_copy(local_path, remote_path, label="Copy file")

    if copy_fwb and fwb_path is not None:
        fwb = Path(fwb_path)
        if fwb.is_file():
            dest_dir = remote_dir.rstrip("/") or "/etc"
            remote_fwb = f"{dest_dir}/{fwb.name}"
            _queue_copy(fwb, remote_fwb, label="Copy data file")
            copies = [*copies, (fwb, remote_fwb)]
        else:
            plan_lines.append(f"Copy data file: skipped (missing {fwb})")

    decompress_cmd: list[str] | None = None
    if decompress_parts:
        remote_shell = " && ".join(decompress_parts)
        plan_lines.append(f"Decompress on host: {remote_shell}")
        decompress_cmd = [*base_ssh, ssh_target, remote_shell]
        commands.append(" ".join(shlex.quote(c) for c in decompress_cmd))

    act = (activation_cmd or "").strip()
    activation_source: str | None = None
    interactive_note: str | None = None
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
                compress=compress,
                generate_rc_conf=generate_rc_conf,
                use_scp=use_scp,
            )
            interactive_note = conf.get("note") if isinstance(conf.get("note"), str) else None
            if conf.get("ok") and conf.get("command"):
                act = str(conf["command"])
                activation_source = conf.get("source")
            else:
                # Fallback: same idea as GUI for regular users.
                act = f"sudo {main_remote}" if user and user != "root" else main_remote
                activation_source = "fallback"
            if conf.get("interactive_installer"):
                plan_lines.append(
                    "Note: OS has pre/post installer configlets; "
                    "WebUI cannot run the full expect/SSHSession installer."
                )
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
    note = (
        "WebUI installer (ssh/scp) with FirewallInstaller-style manifest copy "
        "and OS installer configlets. Not the full desktop expect/SSHSession installer."
    )
    if interactive_note:
        note = f"{note} {interactive_note}"
    result: dict[str, Any] = {
        "ok": True,
        "dry_run": dry_run,
        "mode": "scp_ssh",
        "host": host,
        "user": user,
        "remote_path": main_remote,
        "local_script": str(local_script),
        "files": [{"local": str(lp), "remote": rp} for lp, rp in copies],
        "transfer_files": [{"local": str(lp), "remote": rp} for lp, rp in transfer_copies],
        "compress": bool(compress),
        "manifest": manifest,
        "activation_cmd": act if activate else "",
        "activation_source": activation_source,
        "identity_file": identity_expanded,
        "copy_fwb": bool(copy_fwb),
        "ssh_auth": {
            "batch_mode": True,
            "password_supported": False,
            "keyboard_interactive_supported": False,
            "note": SSH_AUTH_NOTE,
        },
        "plan": plan_lines,
        "commands": commands,
        "log": "",
        "note": note,
    }

    try:
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

        if decompress_cmd is not None:
            code, out = _run(decompress_cmd, timeout=timeout, env=env)
            log_parts.append(f"$ {' '.join(decompress_cmd)}\n{out}")
            if code != 0:
                raise DeployError(
                    f"ssh decompress exited {code}",
                    log="\n".join(log_parts),
                    commands=commands,
                )

        if ssh_cmd is not None:
            code, out = _run(ssh_cmd, timeout=timeout, env=env)
            log_parts.append(f"$ {' '.join(ssh_cmd)}\n{out}")
            if code != 0:
                raise DeployError(
                    f"ssh activate exited {code}",
                    log="\n".join(log_parts),
                    commands=commands,
                )

        result["log"] = "\n".join(log_parts)
        return result
    finally:
        for p in temp_gz:
            try:
                p.unlink(missing_ok=True)
            except OSError:
                pass

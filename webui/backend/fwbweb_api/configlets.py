"""Load and expand FirewallInstaller configlets from src/res/configlets."""

from __future__ import annotations

import re
from pathlib import Path
from typing import Any

from .platforms import get_os, res_dir

_IF_BLOCK = re.compile(
    r"\{\{\s*if\s+(\w+)\s*\}\}(.*?)\{\{\s*endif\s*\}\}",
    re.DOTALL | re.IGNORECASE,
)
_VAR = re.compile(r"\{\{\s*\$(\w+)\s*\}\}")

# Families that may share linux24 installer scripts when no OS-specific dir exists.
_LINUX_FAMILIES = frozenset({"linux24", "linux317", "secuwall", "ipcop"})


def configlets_root() -> Path:
    return res_dir() / "configlets"


def os_family(host_os: str) -> str:
    key = (host_os or "").strip()
    if not key:
        return ""
    try:
        return (get_os(key).get("family") or "").strip()
    except KeyError:
        return ""


def resolve_configlet_dir(host_os: str) -> Path | None:
    """Prefer host_OS dir, then OS family (FirewallInstaller / Configlet semantics).

    Does **not** fall back to linux24 for unrelated OSes (ios/junos/…).
    Only linux-family hosts without their own dir may use linux24.
    """
    root = configlets_root()
    if not root.is_dir():
        return None
    key = (host_os or "").strip()
    if key and (root / key).is_dir():
        return root / key
    family = os_family(key) if key else ""
    if family and (root / family).is_dir():
        return root / family
    # openwrt and similar declare family=linux24 but may lack a private dir
    if family in _LINUX_FAMILIES and (root / "linux24").is_dir():
        return root / "linux24"
    return None


def list_installer_configlets(host_os: str) -> dict[str, Any]:
    directory = resolve_configlet_dir(host_os)
    names: list[str] = []
    if directory and directory.is_dir():
        names = sorted(
            p.name
            for p in directory.iterdir()
            if p.is_file() and p.name.startswith("installer_commands")
        )
    interactive = any(
        n in names
        for n in (
            "installer_commands_pre_config",
            "installer_commands_post_config",
        )
    )
    has_root = "installer_commands_root" in names
    has_reg = "installer_commands_reg_user" in names
    return {
        "host_os": host_os,
        "family": os_family(host_os),
        "configlet_dir": str(directory) if directory else None,
        "names": names,
        "interactive_installer": interactive,
        "webui_modes": {
            "scp_ssh": bool(has_reg or has_root) and not interactive,
            "scp_ssh_limited": bool(has_reg or has_root) and interactive,
            "external_install_script": True,
            "expect_sshsession": False,
        },
        "note": (
            "Desktop FirewallInstaller uses expect/SSHSession with pre/post configlets; "
            "WebUI scp/ssh deploy only expands the activation configlet."
            if interactive
            else None
        ),
    }


def load_installer_configlet(host_os: str, *, user: str) -> str | None:
    directory = resolve_configlet_dir(host_os)
    if directory is None:
        return None
    name = "installer_commands_root" if (user or "").strip() == "root" else "installer_commands_reg_user"
    path = directory / name
    if not path.is_file():
        # Cisco/Juniper often only ship reg_user activation
        alt = directory / "installer_commands_reg_user"
        if name != "installer_commands_reg_user" and alt.is_file():
            return alt.read_text(encoding="utf-8", errors="replace")
        return None
    return path.read_text(encoding="utf-8", errors="replace")


def read_installer_configlet_file(host_os: str, name: str) -> dict[str, Any]:
    """Read a named installer_commands* file (preview only; no expansion)."""
    listing = list_installer_configlets(host_os)
    safe = (name or "").strip()
    if (
        not safe
        or "/" in safe
        or "\\" in safe
        or ".." in safe
        or not safe.startswith("installer_commands")
    ):
        return {
            "ok": False,
            "error": "invalid_configlet_name",
            "host_os": host_os,
            "name": name,
            "names": listing.get("names") or [],
        }
    directory = resolve_configlet_dir(host_os)
    if directory is None:
        return {
            "ok": False,
            "error": "configlet_dir_missing",
            "host_os": host_os,
            "name": safe,
            "names": listing.get("names") or [],
        }
    path = directory / safe
    if not path.is_file():
        return {
            "ok": False,
            "error": "configlet_not_found",
            "host_os": host_os,
            "name": safe,
            "configlet_dir": str(directory),
            "names": listing.get("names") or [],
        }
    text = path.read_text(encoding="utf-8", errors="replace")
    return {
        "ok": True,
        "host_os": host_os,
        "name": safe,
        "configlet_dir": str(directory),
        "path": str(path),
        "size": len(text.encode("utf-8")),
        "text": text,
        "names": listing.get("names") or [],
        "note": "Raw configlet preview for desktop expect path; WebUI does not execute it.",
    }


def expand_configlet(
    text: str,
    *,
    variables: dict[str, str],
    flags: dict[str, bool] | None = None,
) -> str:
    """Expand {{if flag}} / {{$var}} like Configlet::expand (subset)."""
    flags = flags or {}
    # Drop ## documentation lines (same as removeComments for installer scripts)
    lines = [ln for ln in text.splitlines() if not ln.lstrip().startswith("##")]
    body = "\n".join(lines)

    def _if_repl(m: re.Match[str]) -> str:
        name = m.group(1)
        inner = m.group(2)
        return inner if flags.get(name) else ""

    body = _IF_BLOCK.sub(_if_repl, body)

    def _var_repl(m: re.Match[str]) -> str:
        return variables.get(m.group(1), "")

    body = _VAR.sub(_var_repl, body)
    # Collapse blank lines from removed if-blocks
    out_lines = [ln.rstrip() for ln in body.splitlines() if ln.strip()]
    return " ".join(out_lines) if out_lines else ""


def _truthy(value: str | bool | None) -> bool:
    if isinstance(value, bool):
        return value
    if value is None:
        return False
    return str(value).strip().lower() in {"1", "true", "yes", "on"}


def default_activation_cmd(
    *,
    host_os: str,
    user: str,
    fwdir: str,
    fwscript: str,
    remote_path: str,
    firewall_name: str = "",
    compress: bool = False,
    generate_rc_conf: bool = False,
    use_scp: bool = True,
) -> dict[str, Any]:
    """Build activation command from OS installer configlet when possible."""
    listing = list_installer_configlets(host_os)
    raw = load_installer_configlet(host_os, user=user)
    if not raw:
        return {
            "ok": False,
            "source": None,
            "command": "",
            "interactive_installer": listing.get("interactive_installer"),
            "note": listing.get("note"),
        }
    directory = resolve_configlet_dir(host_os)
    cfg_name = (
        "installer_commands_root"
        if (user or "").strip() == "root"
        and directory
        and (directory / "installer_commands_root").is_file()
        else "installer_commands_reg_user"
    )
    source = str(directory / cfg_name) if directory else None
    cmd = expand_configlet(
        raw,
        variables={
            "fwdir": fwdir,
            "fwscript": fwscript,
            "remote_script": remote_path,
            "firewall_name": firewall_name,
            "fwbprompt": "# ",
            "rbtimeout": "0",
            "rbtimeout_sec": "0",
            "fwbuilder_generated_configuration_lines": "",
        },
        flags={
            "run": True,
            "test": False,
            "with_rollback": False,
            "no_rollback": True,
            "with_compression": bool(compress),
            "no_compression": not bool(compress),
            "rc_conf_format": bool(generate_rc_conf),
            "shell_script_format": not bool(generate_rc_conf),
            "using_scp": bool(use_scp),
            "not_using_scp": not bool(use_scp),
            "schedule_rollback": False,
            "cancel_rollback": False,
        },
    )
    return {
        "ok": bool(cmd),
        "source": source,
        "command": cmd,
        "interactive_installer": listing.get("interactive_installer"),
        "note": listing.get("note"),
        "configlet_dir": listing.get("configlet_dir"),
        "names": listing.get("names") or [],
    }

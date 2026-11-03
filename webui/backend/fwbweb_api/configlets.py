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


def configlets_root() -> Path:
    return res_dir() / "configlets"


def resolve_configlet_dir(host_os: str) -> Path | None:
    """Prefer host_OS dir, then OS family (FirewallInstaller semantics)."""
    root = configlets_root()
    if not root.is_dir():
        return None
    key = (host_os or "").strip()
    if key and (root / key).is_dir():
        return root / key
    try:
        family = (get_os(key).get("family") or "").strip() if key else ""
    except KeyError:
        family = ""
    if family and (root / family).is_dir():
        return root / family
    # nftables platform often uses linux24 family for installer scripts
    if (root / "linux24").is_dir():
        return root / "linux24"
    return None


def load_installer_configlet(host_os: str, *, user: str) -> str | None:
    directory = resolve_configlet_dir(host_os)
    if directory is None:
        return None
    name = "installer_commands_root" if (user or "").strip() == "root" else "installer_commands_reg_user"
    path = directory / name
    if not path.is_file():
        return None
    return path.read_text(encoding="utf-8", errors="replace")


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


def default_activation_cmd(
    *,
    host_os: str,
    user: str,
    fwdir: str,
    fwscript: str,
    remote_path: str,
    firewall_name: str = "",
) -> dict[str, Any]:
    """Build activation command from OS installer configlet when possible."""
    raw = load_installer_configlet(host_os, user=user)
    if not raw:
        return {"ok": False, "source": None, "command": ""}
    directory = resolve_configlet_dir(host_os)
    source = str(directory / (
        "installer_commands_root" if (user or "").strip() == "root" else "installer_commands_reg_user"
    )) if directory else None
    cmd = expand_configlet(
        raw,
        variables={
            "fwdir": fwdir,
            "fwscript": fwscript,
            "remote_script": remote_path,
            "firewall_name": firewall_name,
            "fwbprompt": "# ",
            "rbtimeout": "0",
        },
        flags={
            "run": True,
            "test": False,
            "with_rollback": False,
            "no_rollback": True,
            "with_compression": False,
            "no_compression": True,
            "rc_conf_format": False,
            "shell_script_format": True,
        },
    )
    return {"ok": bool(cmd), "source": source, "command": cmd}

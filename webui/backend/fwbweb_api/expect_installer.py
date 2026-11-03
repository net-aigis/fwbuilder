"""Honest stub for desktop FirewallInstaller expect/SSHSession path.

WebUI does not implement interactive Cisco/Juniper/Procurve installers.
This module exists so callers can query capability and get a stable refusal
shape instead of silent incomplete scp/ssh activation.
"""

from __future__ import annotations

from typing import Any

from .configlets import list_installer_configlets

# High-level steps the desktop expect path performs (no reproduction of expect scripts).
_EXPECT_STEPS = (
    "open SSH session (password/keyboard-interactive or key)",
    "run installer_commands_pre_config when present",
    "enter enable / configure mode as required by platform",
    "push or paste generated config (scp or terminal)",
    "run installer_commands_post_config / activation",
    "optional write mem / commit",
)


def expect_installer_status(host_os: str) -> dict[str, Any]:
    listing = list_installer_configlets(host_os)
    interactive = bool(listing.get("interactive_installer"))
    return {
        "host_os": host_os,
        "implemented": False,
        "needed": interactive,
        "interactive_installer": interactive,
        "configlet_dir": listing.get("configlet_dir"),
        "names": listing.get("names") or [],
        "desktop_steps": list(_EXPECT_STEPS) if interactive else [],
        "webui_alternative": (
            "dry_run preview of activation configlet + optional force_limited_installer "
            "scp/ssh (incomplete vs desktop)"
            if interactive
            else "scp_ssh or external PolicyInstallScript"
        ),
        "note": (
            "Expect/SSHSession installer is not implemented in WebUI."
            if interactive
            else "Unix-style scp/ssh installer is the WebUI path for this OS."
        ),
    }


def refuse_expect_install(host_os: str) -> dict[str, Any]:
    """Return a structured refusal payload for live expect installs."""
    status = expect_installer_status(host_os)
    return {
        "ok": False,
        "error": "expect_installer_not_implemented",
        **status,
    }

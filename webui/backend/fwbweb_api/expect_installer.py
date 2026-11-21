"""Expect/SSHSession install plan + status for interactive platforms.

Live execution lives in ``expect_runtime`` (Paramiko shell). This module still
builds ordered plan previews and documents canonical step ids.
"""

from __future__ import annotations

from typing import Any

from .configlets import list_installer_configlets, read_installer_configlet_file

# Canonical expect-plan step ids (executed by POST …/run via expect_runtime).
EXPECT_PLAN_STEP_IDS = (
    "ssh_open",
    "pre_config",
    "reg_user",
    "enable_mode",
    "safety_net_acl",
    "push_config",
    "post_config",
    "write_mem",
)

# Short honesty descriptions for each plan step.
EXPECT_PLAN_STEP_NOTES: dict[str, str] = {
    "ssh_open": "Open SSHSession (password/keyboard-interactive or key) — live via Paramiko.",
    "pre_config": "Run installer_commands_pre_config when present — live.",
    "reg_user": "Run installer_commands_reg_user when present — live.",
    "enable_mode": "Enter enable/configure mode as required by platform — live.",
    "safety_net_acl": "Apply safety_net_acl when present — live.",
    "push_config": "Push or paste generated config on the terminal session — live.",
    "post_config": "Run installer_commands_post_config / activation — live.",
    "write_mem": "Optional write mem / commit — live.",
}

EXPECT_PLAN_STEP_TITLES: dict[str, str] = {
    "ssh_open": "Open SSH session",
    "pre_config": "Pre-config installer commands",
    "reg_user": "Register user commands",
    "enable_mode": "Enable / configure mode",
    "safety_net_acl": "Safety-net ACL",
    "push_config": "Push / paste config",
    "post_config": "Post-config / activation",
    "write_mem": "Write mem / commit",
}

# High-level steps the desktop expect path performs (no reproduction of expect scripts).
_BASE_STEPS = (
    "open SSH session (password/keyboard-interactive or key)",
    "enter enable / configure mode as required by platform",
    "push or paste generated config (scp or terminal)",
    "optional write mem / commit",
)


def _desktop_steps(names: list[str]) -> list[str]:
    """Build step list from which installer / related configlet files exist."""
    steps: list[str] = [
        "open SSH session (password/keyboard-interactive or key)",
    ]
    if "installer_commands_pre_config" in names:
        steps.append("run installer_commands_pre_config")
    if "installer_commands_reg_user" in names:
        steps.append("run installer_commands_reg_user")
    steps.append("enter enable / configure mode as required by platform")
    if "safety_net_acl" in names:
        steps.append("apply safety_net_acl")
    steps.append("push or paste generated config (scp or terminal)")
    if "installer_commands_post_config" in names:
        steps.append("run installer_commands_post_config / activation")
    else:
        steps.append("run activation configlet when present")
    steps.append("optional write mem / commit")
    return steps


def expect_installer_status(host_os: str) -> dict[str, Any]:
    listing = list_installer_configlets(host_os)
    interactive = bool(listing.get("interactive_installer"))
    names = list(listing.get("names") or [])
    related = list(listing.get("related_names") or [])
    plan_names = names + [n for n in related if n not in names]
    return {
        "host_os": host_os,
        "implemented": bool(interactive),
        "needed": interactive,
        "interactive_installer": interactive,
        "configlet_dir": listing.get("configlet_dir"),
        "names": names,
        "related_names": related,
        "has_pre_config": "installer_commands_pre_config" in names,
        "has_post_config": "installer_commands_post_config" in names,
        "has_reg_user": "installer_commands_reg_user" in names,
        "has_safety_net_acl": "safety_net_acl" in plan_names,
        "desktop_steps": _desktop_steps(plan_names) if interactive else list(_BASE_STEPS)[:0],
        "webui_alternative": (
            "POST /expect-install-plan/run (Paramiko expect runtime) or "
            "force_limited_installer scp/ssh"
            if interactive
            else "scp_ssh or external PolicyInstallScript"
        ),
        "note": (
            "Expect/SSHSession installer is implemented via Paramiko shell expect."
            if interactive
            else "Unix-style scp/ssh installer is the WebUI path for this OS."
        ),
    }


def refuse_expect_install(host_os: str, step: str | None = None) -> dict[str, Any]:
    """Return a structured refusal payload (unknown steps / non-interactive OS)."""
    status = expect_installer_status(host_os)
    known = list(EXPECT_PLAN_STEP_IDS)
    out: dict[str, Any] = {
        "ok": False,
        "error": "expect_installer_refused",
        "known_step_ids": known,
        **status,
    }
    if step:
        out["step"] = step
        out["step_refused"] = True
        unknown = step not in known
        out["unknown_step"] = unknown
        if unknown:
            out["error"] = "expect_installer_unknown_step"
            out["note"] = (
                f"Step '{step}' is not a canonical expect plan id and was not executed. "
                f"Known ids: {', '.join(known)}."
            )
        else:
            out["note"] = (
                f"Step '{step}' was not executed in this refusal preview path. "
                "Use POST /expect-install-plan/run for live execution."
            )
    return out


def expect_install_plan(
    host_os: str,
    *,
    fwdir: str = "/etc",
    fwscript: str = "firewall.fw",
) -> dict[str, Any]:
    """Ordered desktop expect steps with expanded configlet previews (not executable)."""
    status = expect_installer_status(host_os)
    names = list(status.get("names") or [])
    related = list(status.get("related_names") or [])
    plan_names = names + [n for n in related if n not in names]
    live = bool(status.get("implemented"))
    steps: list[dict[str, Any]] = [
        {
            "id": "ssh_open",
            "title": "Open SSH session",
            "implemented": live,
            "detail": "password/keyboard-interactive or key via Paramiko",
        },
    ]
    if "installer_commands_pre_config" in plan_names:
        pre = read_installer_configlet_file(
            host_os,
            "installer_commands_pre_config",
            expand=True,
            fwdir=fwdir,
            fwscript=fwscript,
        )
        steps.append(
            {
                "id": "pre_config",
                "title": "Run installer_commands_pre_config",
                "implemented": live,
                "configlet": "installer_commands_pre_config",
                "preview": pre.get("expanded_text") or pre.get("text") or "",
            }
        )
    if "installer_commands_reg_user" in plan_names:
        reg = read_installer_configlet_file(
            host_os,
            "installer_commands_reg_user",
            expand=True,
            fwdir=fwdir,
            fwscript=fwscript,
        )
        steps.append(
            {
                "id": "reg_user",
                "title": "Run installer_commands_reg_user",
                "implemented": live,
                "configlet": "installer_commands_reg_user",
                "preview": reg.get("expanded_text") or reg.get("text") or "",
                "detail": "May run as regular user before enable/root",
            }
        )
    steps.append(
        {
            "id": "enable_mode",
            "title": "Enter enable / configure mode",
            "implemented": live,
            "detail": "platform-specific enable/configure via expect runtime",
        }
    )
    if "safety_net_acl" in plan_names:
        safety = read_installer_configlet_file(
            host_os,
            "safety_net_acl",
            expand=True,
            fwdir=fwdir,
            fwscript=fwscript,
        )
        steps.append(
            {
                "id": "safety_net_acl",
                "title": "Apply safety_net_acl",
                "implemented": live,
                "configlet": "safety_net_acl",
                "preview": safety.get("expanded_text") or safety.get("text") or "",
                "detail": "Temporary ACL during install when configlet present",
            }
        )
    steps.append(
        {
            "id": "push_config",
            "title": "Push or paste generated config",
            "implemented": live,
            "detail": "paste/push on SSH shell session via expect runtime",
        }
    )
    if "installer_commands_post_config" in plan_names:
        post = read_installer_configlet_file(
            host_os,
            "installer_commands_post_config",
            expand=True,
            fwdir=fwdir,
            fwscript=fwscript,
        )
        steps.append(
            {
                "id": "post_config",
                "title": "Run installer_commands_post_config / activation",
                "implemented": live,
                "configlet": "installer_commands_post_config",
                "preview": post.get("expanded_text") or post.get("text") or "",
            }
        )
    steps.append(
        {
            "id": "write_mem",
            "title": "Optional write mem / commit",
            "implemented": live,
        }
    )
    return {
        "ok": True,
        "executable": live,
        "error": None if live else "expect_installer_not_needed",
        "host_os": host_os,
        "steps": steps,
        "step_count": len(steps),
        "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
        **{k: status[k] for k in status if k not in {"desktop_steps"}},
        "note": (
            "Expect install plan is a read-only preview of desktop steps. "
            "WebUI does not open an SSHSession or run expect. "
            "canonical_step_ids lists every id POST /run may refuse (all → 501)."
        ),
    }


def expect_install_walkthrough(
    host_os: str,
    *,
    fwdir: str = "/etc",
    fwscript: str = "firewall.fw",
) -> dict[str, Any]:
    """Dry walkthrough of expect plan steps — all preview_only, none executed."""
    from datetime import datetime, timezone

    plan = expect_install_plan(host_os, fwdir=fwdir, fwscript=fwscript)
    started = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    steps_out: list[dict[str, Any]] = []
    for idx, step in enumerate(plan.get("steps") or []):
        steps_out.append(
            {
                "id": step.get("id"),
                "title": step.get("title"),
                "status": "preview_only",
                "runnable": False,
                "implemented": False,
                "ordinal": idx + 1,
                "configlet": step.get("configlet"),
                "has_preview": bool(step.get("preview")),
                "detail": step.get("detail")
                or "Not executed; WebUI has no expect/SSHSession runtime",
                "simulated_at": started,
            }
        )
    return {
        "ok": True,
        "executable": False,
        "error": "expect_installer_not_implemented",
        "host_os": host_os,
        "walkthrough": True,
        "steps": steps_out,
        "step_count": len(steps_out),
        "all_preview_only": True,
        "timeline_start": started,
        "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "note": (
            "Walkthrough lists desktop expect steps with preview_only status. "
            "No SSH session is opened and no step is run. "
            "simulated_at is a timeline stamp only, not execution."
        ),
        "has_reg_user": plan.get("has_reg_user"),
        "has_safety_net_acl": plan.get("has_safety_net_acl"),
        "needed": plan.get("needed"),
        "interactive_installer": plan.get("interactive_installer"),
    }


def expect_plan_step_catalog() -> dict[str, Any]:
    """Canonical expect plan step ids (live via POST /run)."""
    return {
        "ok": True,
        "executable": True,
        "error": None,
        "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "step_notes": dict(EXPECT_PLAN_STEP_NOTES),
        "step_count": len(EXPECT_PLAN_STEP_IDS),
        "run_path": "/api/v1/expect-install-plan/run",
        "run_status": 200,
        "note": (
            "Catalog of canonical expect plan step ids. "
            "POST /expect-install-plan/run executes them via Paramiko expect "
            "(mock=true for fixtures). Unknown step ids → 400."
        ),
    }


def expect_plan_step_refusals(host_os: str) -> dict[str, Any]:
    """Historical name: now documents live step readiness (unknown still refused)."""
    status = expect_installer_status(host_os)
    live = bool(status.get("implemented"))
    steps = [
        {
            "ok": live,
            "step": step_id,
            "executable": live,
            "error": None if live else "expect_installer_not_needed",
            "note": EXPECT_PLAN_STEP_NOTES.get(step_id, ""),
        }
        for step_id in EXPECT_PLAN_STEP_IDS
    ]
    return {
        "ok": live,
        "executable": live,
        "error": None if live else "expect_installer_not_needed",
        "host_os": host_os,
        "step_count": len(steps),
        "all_refused": False,
        "run_status": 200 if live else 400,
        "run_path": "/api/v1/expect-install-plan/run",
        "steps_path": "/api/v1/expect-install-plan/steps",
        "steps": steps,
        "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "unknown_step_probe": refuse_expect_install(host_os, step="__unknown_probe__"),
        "note": (
            "Per-step readiness for POST /run. "
            "unknown_step_probe remains a refusal preview for invalid ids."
        ),
    }

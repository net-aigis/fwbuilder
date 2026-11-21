from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query
from pydantic import BaseModel, Field

from ..auth import require_token
from ..configlets import (
    default_activation_cmd,
    list_installer_configlets,
    read_installer_configlet_file,
    resolve_configlet_dir,
)
from ..deploy import ssh_auth_capabilities
from ..expect_installer import (
    EXPECT_PLAN_STEP_IDS,
    expect_install_plan,
    expect_install_walkthrough,
    expect_installer_status,
    expect_plan_step_catalog,
    expect_plan_step_refusals,
)
from ..platforms import (
    get_os,
    get_platform,
    interface_option_schema,
    layout_fidelity_for,
    list_oses,
    list_platforms,
    option_schema,
    rule_option_schema,
    option_enable_for,
    stack_switch_for,
)

router = APIRouter(prefix="/api/v1", tags=["platforms"])


@router.get("/platforms")
def platforms(_: str = Depends(require_token)) -> dict[str, Any]:
    return {"platforms": list_platforms(), "oses": list_oses()}


@router.get("/platforms/{name}")
def platform_detail(name: str, _: str = Depends(require_token)) -> dict[str, Any]:
    try:
        return get_platform(name)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail=f"unknown platform: {name}") from exc
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc


@router.get("/oses/{name}")
def os_detail(name: str, _: str = Depends(require_token)) -> dict[str, Any]:
    try:
        return get_os(name)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail=f"unknown os: {name}") from exc
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc


@router.get("/option-schema")
def get_option_schema(
    platform: str = Query(..., min_length=1),
    host_os: str = Query(""),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        return option_schema(platform, host_os)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail=f"unknown platform: {platform}") from exc
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc


@router.get("/interface-option-schema")
def get_interface_option_schema(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        return interface_option_schema(host_os)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail=f"unknown os: {host_os}") from exc
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc


@router.get("/installer-configlets")
def get_installer_configlets(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """List installer_commands* configlets resolved for host_OS (family fallback)."""
    return list_installer_configlets(host_os)


@router.get("/installer-capabilities")
def get_installer_capabilities(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Honest WebUI vs desktop FirewallInstaller capability summary for host_OS."""
    listing = list_installer_configlets(host_os)
    modes = listing.get("webui_modes") or {}
    expect = expect_installer_status(host_os)
    return {
        **listing,
        "desktop_full_installer": listing.get("interactive_installer"),
        "expect_installer": expect,
        "expect_install_plan": {
            "available": True,
            "executable": False,
            "path": "/api/v1/expect-install-plan",
            "walkthrough_path": "/api/v1/expect-install-plan/walkthrough",
            "steps_path": "/api/v1/expect-install-plan/steps",
            "steps_refusals_path": "/api/v1/expect-install-plan/steps/refusals",
            "run_path": "/api/v1/expect-install-plan/run",
            "run_status": 501,
            "canonical_step_ids": list(EXPECT_PLAN_STEP_IDS),
            "note": (
                "GET returns ordered preview; GET walkthrough marks every step "
                "preview_only; GET /steps lists canonical ids; "
                "GET /steps/refusals previews per-step 501 payloads; "
                "POST /run always refuses with 501 "
                "(unknown step → expect_installer_unknown_step)."
            ),
        },
        "ssh_auth": {
            **ssh_auth_capabilities(),
            "password_probe_path": "/api/v1/ssh-auth/password",
            "password_probe_status": 501,
        },
        "recommended_webui_mode": (
            "external_install_script"
            if not (modes.get("scp_ssh") or modes.get("scp_ssh_limited"))
            else ("scp_ssh_limited" if modes.get("scp_ssh_limited") else "scp_ssh")
        ),
    }


@router.get("/expect-installer")
def get_expect_installer(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Status of the (unimplemented) desktop expect/SSHSession installer path."""
    return expect_installer_status(host_os)


@router.get("/expect-install-plan")
def get_expect_install_plan(
    host_os: str = Query(..., min_length=1),
    fwdir: str = Query("/etc"),
    fwscript: str = Query("firewall.fw"),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Ordered desktop expect steps with configlet previews (not executable)."""
    return expect_install_plan(host_os, fwdir=fwdir, fwscript=fwscript)


@router.get("/expect-install-plan/walkthrough")
def get_expect_install_walkthrough(
    host_os: str = Query(..., min_length=1),
    fwdir: str = Query("/etc"),
    fwscript: str = Query("firewall.fw"),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Dry walkthrough of expect steps (all preview_only; nothing executed)."""
    return expect_install_walkthrough(host_os, fwdir=fwdir, fwscript=fwscript)


@router.get("/expect-install-plan/steps")
def get_expect_install_plan_steps(
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Canonical expect plan step ids (all refused by POST /run)."""
    return expect_plan_step_catalog()


@router.get("/expect-install-plan/steps/refusals")
def get_expect_install_plan_step_refusals(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Per-step refusal preview for every canonical id (nothing executed)."""
    return expect_plan_step_refusals(host_os)


class ExpectRunRequest(BaseModel):
    host: str = ""
    user: str = ""
    password: str | None = None
    keyboard_interactive_responses: list[str] | None = None
    identity_file: str | None = None
    enable_password: str | None = None
    fwdir: str = "/etc"
    fwscript: str = "firewall.fw"
    config_text: str = ""
    mock: bool = False
    port: int = 22
    timeout: float = 30.0


@router.post("/expect-install-plan/run")
def run_expect_install_plan(
    host_os: str = Query(..., min_length=1),
    step: str | None = Query(None, description="Optional single canonical step id"),
    body: ExpectRunRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Execute expect/SSHSession install steps (Paramiko). Use mock=true for fixtures."""
    from ..expect_installer import refuse_expect_install
    from ..expect_runtime import ExpectRuntimeError, run_expect_steps
    from ..configlets import list_installer_configlets

    req = body or ExpectRunRequest()
    listing = list_installer_configlets(host_os)
    if not listing.get("interactive_installer") and not req.mock:
        raise HTTPException(
            status_code=400,
            detail={
                "ok": False,
                "error": "expect_installer_not_needed",
                "host_os": host_os,
                "note": "This host_OS uses scp/ssh or external install script, not expect.",
            },
        )
    if step and step not in EXPECT_PLAN_STEP_IDS:
        raise HTTPException(
            status_code=400,
            detail=refuse_expect_install(host_os, step=step),
        )
    try:
        return run_expect_steps(
            host_os=host_os,
            host=req.host,
            user=req.user,
            password=req.password,
            keyboard_interactive_responses=req.keyboard_interactive_responses,
            identity_file=req.identity_file,
            enable_password=req.enable_password,
            fwdir=req.fwdir,
            fwscript=req.fwscript,
            config_text=req.config_text,
            step=step,
            mock=req.mock,
            port=req.port,
            timeout=req.timeout,
        )
    except ExpectRuntimeError as exc:
        raise HTTPException(
            status_code=400,
            detail={
                "ok": False,
                "error": "expect_runtime_failed",
                "message": str(exc),
                "step": exc.step,
                "log": exc.log,
            },
        ) from exc


@router.get("/layout-fidelity")
def get_layout_fidelity(
    platform: str = Query(..., min_length=1),
    host_os: str = Query(""),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Heuristic .ui layout-signal coverage + pixel_parity from geometry oracle."""
    return layout_fidelity_for(platform, host_os)


@router.get("/layout-fidelity/geometry-oracle")
def get_geometry_oracle(
    dialog: str = Query("", description="Dialog stem; default resolves from platform"),
    platform: str = Query(""),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Absolute widget rect oracle from .ui grid/sizeHint/spacing/geometry."""
    from ..geometry_oracle import geometry_oracle_for_dialog
    from ..platforms import _dialog_stem, get_platform, _dialog_catalog

    stem = dialog.strip()
    if not stem and platform:
        try:
            plat = get_platform(platform)
            stem = _dialog_stem(plat.get("dialog") or platform)
        except KeyError:
            stem = _dialog_stem(platform)
    if not stem:
        # Prefer first core dialog present
        cat = _dialog_catalog()
        dialogs = cat.get("dialogs") or {}
        for cand in ("firewall_options", "interface_options"):
            if cand in dialogs:
                stem = cand
                break
        if not stem and dialogs:
            stem = next(iter(dialogs))
    return geometry_oracle_for_dialog(stem)


class ParityCheckRequest(BaseModel):
    dialog: str = ""
    chrome: dict[str, int] | None = None
    widgets: dict[str, dict[str, int]] | None = None
    self_check: bool = False


@router.post("/layout-fidelity/parity-check")
def post_parity_check(
    body: ParityCheckRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Compare measured DOM rects to geometry oracle (or run self-harness)."""
    from ..geometry_oracle import (
        check_parity,
        geometry_oracle_for_dialog,
        verify_core_dialogs_parity,
        verify_dialog_self_parity,
    )

    if body.self_check and not body.dialog:
        return verify_core_dialogs_parity()
    stem = body.dialog.strip() or "firewall_options"
    if body.self_check:
        return verify_dialog_self_parity(stem)
    oracle = geometry_oracle_for_dialog(stem)
    measured = {"chrome": body.chrome or {}, "widgets": body.widgets or {}}
    return check_parity(oracle, measured)


@router.get("/stack-switch")
def get_stack_switch(
    platform: str = Query(""),
    host_os: str = Query(""),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Desktop QStackedWidget switch maps (preview/follow; not pixel parity)."""
    return stack_switch_for(platform, host_os)


@router.get("/option-enable")
def get_option_enable(
    platform: str = Query(""),
    host_os: str = Query(""),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Desktop option enable/disable dependency maps (preview/follow)."""
    return option_enable_for(platform, host_os)


@router.get("/ssh-auth")
def get_ssh_auth(_: str = Depends(require_token)) -> dict[str, Any]:
    """WebUI SSH authentication capabilities (BatchMode + password/KBI)."""
    return ssh_auth_capabilities()


class PasswordSshRequest(BaseModel):
    host: str = Field(..., min_length=1)
    user: str = ""
    password: str | None = None
    keyboard_interactive_responses: list[str] | None = None
    identity_file: str | None = None
    port: int = 22
    timeout: float = 20.0


@router.post("/ssh-auth/password")
def probe_password_ssh(
    body: PasswordSshRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Probe password / keyboard-interactive SSH (Paramiko); secret not stored."""
    has_secret = bool(body.password) or body.keyboard_interactive_responses is not None
    if not has_secret:
        raise HTTPException(
            status_code=400,
            detail={
                "ok": False,
                "error": "password_auth_secret_required",
                "ssh_auth": ssh_auth_capabilities(),
            },
        )
    from ..ssh_session import SshSessionError, probe_password_auth

    try:
        result = probe_password_auth(
            host=body.host,
            user=body.user,
            password=body.password,
            keyboard_interactive_responses=body.keyboard_interactive_responses,
            identity_file=body.identity_file,
            port=body.port,
            timeout=body.timeout,
        )
    except SshSessionError as exc:
        raise HTTPException(
            status_code=401,
            detail={
                "ok": False,
                "error": "ssh_auth_failed",
                "message": str(exc),
                "ssh_auth": ssh_auth_capabilities(),
            },
        ) from exc
    return {**result, "ssh_auth": ssh_auth_capabilities()}


@router.get("/installer-configlet")
def get_installer_configlet(
    host_os: str = Query(..., min_length=1),
    user: str = Query("fwadmin"),
    fwdir: str = Query("/etc"),
    fwscript: str = Query("firewall.fw"),
    compress: bool = Query(False),
    generate_rc_conf: bool = Query(False),
    use_scp: bool = Query(True),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Preview expanded FirewallInstaller activation configlet for an OS/user."""
    directory = resolve_configlet_dir(host_os)
    preview = default_activation_cmd(
        host_os=host_os,
        user=user,
        fwdir=fwdir.rstrip("/") or "/etc",
        fwscript=fwscript,
        remote_path=f"{fwdir.rstrip('/')}/{fwscript}",
        firewall_name="preview",
        compress=compress,
        generate_rc_conf=generate_rc_conf,
        use_scp=use_scp,
    )
    family = ""
    try:
        family = get_os(host_os).get("family") or ""
    except KeyError:
        family = ""
    return {
        "host_os": host_os,
        "family": family,
        "configlet_dir": str(directory) if directory else None,
        "user": user,
        "preview": preview,
        "interactive_installer": preview.get("interactive_installer"),
        "names": preview.get("names") or [],
        "note": preview.get("note"),
    }


@router.get("/installer-configlet-file")
def get_installer_configlet_file(
    host_os: str = Query(..., min_length=1),
    name: str = Query(..., min_length=1),
    expand: bool = Query(False),
    fwdir: str = Query("/etc"),
    fwscript: str = Query("firewall.fw"),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Raw or expanded installer_commands* file preview (read-only; not executed)."""
    result = read_installer_configlet_file(
        host_os,
        name,
        expand=expand,
        fwdir=fwdir,
        fwscript=fwscript,
    )
    if not result.get("ok"):
        err = result.get("error")
        if err == "invalid_configlet_name":
            raise HTTPException(status_code=400, detail=result)
        raise HTTPException(status_code=404, detail=result)
    return result


@router.get("/rule-option-schema")
def get_rule_option_schema(
    rule_kind: str = Query("policy"),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        return rule_option_schema(rule_kind)
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query

from ..auth import require_token
from ..configlets import (
    default_activation_cmd,
    list_installer_configlets,
    read_installer_configlet_file,
    resolve_configlet_dir,
)
from ..deploy import ssh_auth_capabilities
from ..expect_installer import (
    expect_install_plan,
    expect_install_walkthrough,
    expect_installer_status,
)
from ..platforms import (
    get_os,
    get_platform,
    interface_option_schema,
    list_oses,
    list_platforms,
    option_schema,
    rule_option_schema,
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
            "run_path": "/api/v1/expect-install-plan/run",
            "run_status": 501,
            "note": (
                "GET returns ordered preview; GET walkthrough marks every step "
                "preview_only; POST /run always refuses with 501."
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


@router.post("/expect-install-plan/run")
def run_expect_install_plan(
    host_os: str = Query(..., min_length=1),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Explicit refusal: WebUI never executes the desktop expect installer."""
    from ..expect_installer import refuse_expect_install

    raise HTTPException(status_code=501, detail=refuse_expect_install(host_os))


@router.get("/ssh-auth")
def get_ssh_auth(_: str = Depends(require_token)) -> dict[str, Any]:
    """WebUI SSH authentication capabilities (BatchMode only today)."""
    return ssh_auth_capabilities()


@router.post("/ssh-auth/password")
def refuse_password_ssh(_: str = Depends(require_token)) -> dict[str, Any]:
    """Explicit refusal endpoint for password/keyboard-interactive SSH."""
    raise HTTPException(
        status_code=501,
        detail={
            "ok": False,
            "error": "password_auth_not_implemented",
            "ssh_auth": ssh_auth_capabilities(),
            "note": (
                "Password and keyboard-interactive SSH are not implemented. "
                "Use BatchMode key/agent auth only."
            ),
        },
    )


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

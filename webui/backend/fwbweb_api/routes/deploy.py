from __future__ import annotations

from pathlib import Path
from typing import Any

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from ..auth import require_token
from ..bridge import BridgeError
from ..compile import CompileError, run_compiler
from ..deploy import DeployError, plan_and_deploy, plan_external_install, ssh_auth_capabilities
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["deploy"])

# Installer-related FirewallOptions keys commonly used by the desktop GUI.
INSTALLER_OPTION_KEYS = (
    "admUser",
    "altAddress",
    "activationCmd",
    "firewall_dir",
    "output_file",
    "sshArgs",
    "scpArgs",
    "use_scp",
)


class DeployRequest(BaseModel):
    firewall_id: str = Field(..., min_length=1)
    host: str | None = None
    user: str | None = None
    remote_dir: str | None = None
    remote_name: str | None = None
    activation_cmd: str | None = None
    activate: bool = True
    compile_first: bool = True
    dry_run: bool = True
    identity_file: str | None = None
    ipv: str | None = None
    # Desktop stores compressScript in QSettings; WebUI passes it per deploy.
    compress: bool | None = None
    use_scp: bool | None = None
    # Desktop Installer preference copyFWB — also scp the .fwb project file.
    copy_fwb: bool = False
    # Live scp/ssh on Cisco/Juniper/… is incomplete; require explicit opt-in.
    force_limited_installer: bool = False
    # Password/keyboard-interactive is not implemented; requesting it is refused.
    allow_password_auth: bool = False


@router.post("/{session_id}/deploy")
def deploy_firewall(
    session_id: str,
    body: DeployRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    if body.allow_password_auth:
        raise HTTPException(
            status_code=400,
            detail={
                "error": "password_auth_not_implemented",
                "ssh_auth": ssh_auth_capabilities(),
            },
        )
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc

    try:
        fw_resp = session.bridge.request("get", id=body.firewall_id)
        opts_resp = session.bridge.request("options", id=body.firewall_id)
        mgmt_resp = session.bridge.request("management", id=body.firewall_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc

    fw = fw_resp.get("object") or {}
    if fw.get("type") != "Firewall":
        raise HTTPException(status_code=400, detail="firewall_id must be a Firewall")
    name = fw.get("name") or ""
    platform = str((fw.get("attrs") or {}).get("platform") or "")
    options: dict[str, str] = dict(opts_resp.get("options") or {})
    mgmt = mgmt_resp.get("management") or {}

    host = (body.host or options.get("altAddress") or mgmt.get("address") or "").strip()
    user = (body.user if body.user is not None else options.get("admUser") or "").strip()
    remote_dir = (body.remote_dir or options.get("firewall_dir") or "/etc").strip() or "/etc"
    activation = (
        body.activation_cmd
        if body.activation_cmd is not None
        else options.get("activationCmd") or ""
    )
    pis = mgmt.get("install_script") or {}
    pis_cmd = str(pis.get("command") or "").strip()
    use_external = bool(pis_cmd) and bool(pis.get("enabled", True))
    if not use_external and host in ("", "0.0.0.0", "::"):
        raise HTTPException(
            status_code=400,
            detail="no management/alt address; set Management address or pass host",
        )

    compile_result: dict[str, Any] | None = None
    if body.compile_first:
        try:
            session.bridge.request("save")
        except BridgeError as exc:
            raise HTTPException(status_code=500, detail=f"save before deploy failed: {exc}") from exc
        out_dir = Path(session.work_path).parent / "compile-out" / name
        try:
            compile_result = run_compiler(
                platform=platform,
                fwb_path=Path(session.work_path),
                firewall_name=name,
                destdir=out_dir,
                ipv=body.ipv,  # type: ignore[arg-type]
            )
        except CompileError as exc:
            raise HTTPException(
                status_code=400,
                detail={"message": str(exc), "exit_code": exc.exit_code, "log": exc.log},
            ) from exc
        session.meta["last_compile"] = {
            "firewall_id": body.firewall_id,
            "firewall": name,
            "platform": platform,
            "destdir": compile_result["destdir"],
            "outputs": compile_result["outputs"],
        }
    else:
        last = session.meta.get("last_compile") or {}
        if last.get("firewall_id") != body.firewall_id or not last.get("destdir"):
            if use_external:
                compile_result = {
                    "destdir": "",
                    "outputs": [],
                    "compiler": "(skipped; external install script)",
                    "ok": True,
                }
            else:
                raise HTTPException(
                    status_code=400,
                    detail="no prior compile for this firewall; set compile_first=true",
                )
        else:
            compile_result = {
                "destdir": last["destdir"],
                "outputs": last.get("outputs") or [],
                "compiler": "(cached)",
                "ok": True,
            }

    # Desktop FirewallInstallerUnx: non-empty PolicyInstallScript command
    # replaces scp/activate entirely (enabled flag still stored on the object).
    if use_external:
        try:
            deploy_result = plan_external_install(
                command=pis_cmd,
                arguments=str(pis.get("arguments") or ""),
                fwb_path=Path(session.work_path),
                firewall_name=name,
                work_dir=str(Path(session.work_path).parent),
                dry_run=body.dry_run,
                timeout=120.0,
            )
        except DeployError as exc:
            raise HTTPException(
                status_code=400,
                detail={"message": str(exc), "log": exc.log, "commands": exc.commands},
            ) from exc
        if not body.dry_run and deploy_result.get("ok"):
            try:
                session.bridge.request("touch_compiled", id=body.firewall_id)
                session.bridge.request("touch_installed", id=body.firewall_id)
                session.bridge.request("save")
            except BridgeError:
                pass
        return {
            "ok": True,
            "firewall": name,
            "platform": platform,
            "installer_options": {k: options.get(k, "") for k in INSTALLER_OPTION_KEYS},
            "compile": compile_result,
            "deploy": deploy_result,
        }

    outputs = list((compile_result or {}).get("outputs") or [])
    if not outputs:
        raise HTTPException(status_code=400, detail="compile produced no output files")
    preferred = options.get("output_file") or f"{name}.fw"
    script_name = preferred if preferred in outputs else outputs[0]
    local_script = Path(compile_result["destdir"]) / script_name

    try:
        host_os = str((fw.get("attrs") or {}).get("host_OS") or "")
        if host_os and not body.dry_run and not body.force_limited_installer:
            from ..configlets import list_installer_configlets

            listing = list_installer_configlets(host_os)
            if listing.get("interactive_installer"):
                raise HTTPException(
                    status_code=400,
                    detail=(
                        f"host_OS={host_os} needs the desktop expect/SSHSession installer. "
                        "Use dry_run=true, or pass force_limited_installer=true to run "
                        "simplified WebUI scp/ssh anyway."
                    ),
                )

        def _opt_bool(key: str, default: bool = False) -> bool:
            raw = (options.get(key) or "").strip().lower()
            if not raw:
                return default
            return raw in {"1", "true", "yes", "on"}

        deploy_result = plan_and_deploy(
            local_script=local_script,
            host=host,
            user=user,
            remote_dir=remote_dir,
            # Only override remote name when the client sets it explicitly.
            # Otherwise keep FirewallInstaller-style absolute paths from `# files:`.
            remote_name=body.remote_name,
            activate=body.activate,
            activation_cmd=activation,
            host_os=host_os,
            firewall_name=name,
            compress=(
                body.compress
                if body.compress is not None
                else (_opt_bool("compressScript") or _opt_bool("compress"))
            ),
            generate_rc_conf=_opt_bool("generate_rc_conf_file"),
            use_scp=(
                body.use_scp
                if body.use_scp is not None
                else _opt_bool("use_scp", default=True)
            ),
            copy_fwb=bool(body.copy_fwb),
            fwb_path=Path(session.work_path),
            ssh_args=options.get("sshArgs") or "",
            scp_args=options.get("scpArgs") or "",
            identity_file=body.identity_file,
            dry_run=body.dry_run,
            timeout=120.0,
        )
    except DeployError as exc:
        raise HTTPException(
            status_code=400,
            detail={"message": str(exc), "log": exc.log, "commands": exc.commands},
        ) from exc

    if not body.dry_run and deploy_result.get("ok"):
        try:
            session.bridge.request("touch_compiled", id=body.firewall_id)
            session.bridge.request("touch_installed", id=body.firewall_id)
            session.bridge.request("save")
        except BridgeError:
            pass

    return {
        "ok": True,
        "firewall": name,
        "platform": platform,
        "installer_options": {k: options.get(k, "") for k in INSTALLER_OPTION_KEYS},
        "compile": compile_result,
        "deploy": deploy_result,
    }

from __future__ import annotations

from fastapi import Depends, FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware

from .auth import require_token
from .routes.compile import router as compile_router
from .routes.deploy import router as deploy_router
from .routes.options import router as options_router
from .routes.platforms import router as platforms_router
from .routes.projects import router as projects_router
from .routes.rules import router as rules_router
from .settings import settings

app = FastAPI(
    title="Firewall Builder WebUI API",
    version="0.1.0",
    description="REST/WebSocket front for the libfwbuilder fwbweb bridge",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(projects_router)
app.include_router(rules_router)
app.include_router(compile_router)
app.include_router(options_router)
app.include_router(deploy_router)
app.include_router(platforms_router)


# Soft-complete marker for the hard-gap honesty/preview track (not full expect/pixel).
WEBUI_SOFT_COMPLETE_PHASE = "640"
# Honesty/preview track milestone (last thematic checkpoint; soft marker may be higher).
WEBUI_HONESTY_MILESTONE = 600

HARD_GAPS_OPEN = (
    "full_qt_pixel_layout",
    "expect_sshsession_runtime",
    "password_keyboard_interactive_ssh",
)

HARD_GAP_NOTES = {
    "full_qt_pixel_layout": (
        "Grid/spacers/stretch/buddy_labels/alignment/sizePolicy/sizeHint/"
        "layout_tree/tab_position/sizeGrip/QStackedWidget pages extracted "
        "(Firewall + Interface section chrome + empty pages + stack switcher + "
        "use_ULOG/device-type stack hints + option_enable follow); "
        "fidelity counts with_visible + sections flat/checkable + signal_keys + "
        "layout_tree_max_depth; visible=false keeps field-ui-hidden grid holes; "
        "exact pixel geometry still open."
    ),
    "expect_sshsession_runtime": (
        "Plan + walkthrough + configlet previews available; POST /run → 501; "
        "no SSHSession/expect execution. Canonical refused step ids listed as "
        "expect_plan_step_ids on /hard-gaps; GET …/steps/refusals previews "
        "per-step 501 payloads."
    ),
    "password_keyboard_interactive_ssh": (
        "BatchMode only (batch_mode_only); allow_password_auth → 400; "
        "POST /ssh-auth/password → 501 with alternatives/refusal_paths."
    ),
}

HARD_GAP_CLOSURE = {
    "full_qt_pixel_layout": (
        "Close when AdvancedDialog pages render with desktop-equivalent geometry "
        "(row/col sizes, nested layouts, and widget bounds match Qt within a stated "
        "tolerance) — layout-fidelity score alone is not sufficient."
    ),
    "expect_sshsession_runtime": (
        "Close when WebUI can open an SSHSession and run the desktop expect install "
        "path for interactive platforms (Cisco/Juniper/Procurve), or an explicitly "
        "documented subset with live execution (not preview-only / 501)."
    ),
    "password_keyboard_interactive_ssh": (
        "Close when password and/or keyboard-interactive SSH auth works for deploy "
        "(BatchMode-only is not enough); must not hang on prompts."
    ),
}


@app.get("/api/v1/health")
def health() -> dict[str, object]:
    return {
        "status": "ok",
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "hard_gap_count": len(HARD_GAPS_OPEN),
    }


@app.get("/api/v1/res-status")
def res_status(_: str = Depends(require_token)) -> dict[str, object]:
    """Report FWBUILDER_RES_DIR / configlets availability for installer features."""
    from .configlets import configlets_root
    from .platforms import res_dir

    root = res_dir()
    cfg = configlets_root()
    dirs: list[str] = []
    if cfg.is_dir():
        dirs = sorted(p.name for p in cfg.iterdir() if p.is_dir())
    return {
        "status": "ok" if root.is_dir() else "missing_res",
        "res_dir": str(root),
        "res_ok": root.is_dir(),
        "configlets_dir": str(cfg),
        "configlets_ok": cfg.is_dir(),
        "configlet_os_count": len(dirs),
        "configlet_os": dirs,
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_count": len(HARD_GAPS_OPEN),
    }


@app.get("/api/v1/hard-gaps")
def hard_gaps(_: str = Depends(require_token)) -> dict[str, object]:
    """Explicit list of remaining hard-gap items (honesty track)."""
    from .deploy import ssh_auth_capabilities
    from .expect_installer import EXPECT_PLAN_STEP_IDS
    from .platforms import layout_fidelity_for

    ssh = ssh_auth_capabilities()
    sample_fid = layout_fidelity_for("iptables", "linux24")
    signal_catalog = sample_fid.get("signal_keys") if sample_fid.get("ok") else None
    honesty_paths = {
        "hard_gaps": "/api/v1/hard-gaps",
        "summary": "/api/v1/hard-gaps/summary",
        "closure": "/api/v1/hard-gaps/closure",
        "layout_fidelity": "/api/v1/layout-fidelity",
        "stack_switch": "/api/v1/stack-switch",
        "option_enable": "/api/v1/option-enable",
        "expect_run": "/api/v1/expect-install-plan/run",
        "expect_steps": "/api/v1/expect-install-plan/steps",
        "expect_steps_refusals": "/api/v1/expect-install-plan/steps/refusals",
        "ssh_auth": "/api/v1/ssh-auth",
        "password_ssh": "/api/v1/ssh-auth/password",
    }
    return {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_notes": dict(HARD_GAP_NOTES),
        "hard_gap_closure": dict(HARD_GAP_CLOSURE),
        "closure_path": honesty_paths["closure"],
        "layout_fidelity_path": honesty_paths["layout_fidelity"],
        "layout_fidelity_signal_catalog": signal_catalog,
        "stack_switch_path": honesty_paths["stack_switch"],
        "option_enable_path": honesty_paths["option_enable"],
        "expect_run_path": honesty_paths["expect_run"],
        "expect_steps_path": honesty_paths["expect_steps"],
        "expect_steps_refusals_path": honesty_paths["expect_steps_refusals"],
        "expect_plan_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "ssh_auth_path": honesty_paths["ssh_auth"],
        "password_ssh_path": honesty_paths["password_ssh"],
        "ssh_batch_mode_only": bool(ssh.get("batch_mode_only")),
        "ssh_alternatives": list(ssh.get("alternatives") or []),
        "ssh_refusal_paths": dict(ssh.get("refusal_paths") or {}),
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_paths": honesty_paths,
        "honesty_paths_count": len(honesty_paths),
        "summary_path": "/api/v1/hard-gaps/summary",
        "note": (
            "Honesty/preview track is soft-complete (soft_fertig); these items remain "
            "unimplemented (full Qt pixel layout, expect/SSHSession runtime, password SSH). "
            "GET /layout-fidelity reports extracted-signal coverage only "
            "(includes stacked_sections / with_visible / signal_keys). "
            "GET /stack-switch and /option-enable expose desktop maps for preview/follow. "
            "POST expect-install-plan/run and ssh-auth/password stay 501. "
            "expect_plan_step_ids / GET expect-install-plan/steps list canonical plan "
            "step ids (all refused; unknown step → expect_installer_unknown_step). "
            "ssh_refusal_paths documents BatchMode-only refuse status codes. "
            "hard_gap_closure documents what would close each gap. "
            "honesty_paths catalogs honesty/preview endpoints. "
            "GET /hard-gaps/summary is the compact honesty snapshot."
        ),
    }


@app.get("/api/v1/hard-gaps/summary")
def hard_gaps_summary(_: str = Depends(require_token)) -> dict[str, object]:
    """Compact honesty-track snapshot (counts + open ids; no full notes/paths)."""
    from .platforms import layout_fidelity_for

    full = hard_gaps()
    sample_fid = layout_fidelity_for("iptables", "linux24")
    sample_score = sample_fid.get("score_percent") if sample_fid.get("ok") else None
    sample_parts = sample_fid.get("score_parts_count") if sample_fid.get("ok") else None
    return {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "honesty_paths_count": int(full.get("honesty_paths_count") or 0),
        "layout_fidelity_sample_platform": "iptables",
        "layout_fidelity_sample_host_os": "linux24",
        "layout_fidelity_sample_score_percent": sample_score,
        "layout_fidelity_sample_score_parts_count": sample_parts,
        "layout_fidelity_pixel_parity": False,
        "parent_path": "/api/v1/hard-gaps",
        "closure_path": "/api/v1/hard-gaps/closure",
        "layout_fidelity_path": "/api/v1/layout-fidelity",
        "note": (
            "Compact honesty snapshot. Prefer GET /hard-gaps for full paths/notes "
            "and GET /hard-gaps/closure for closure criteria. "
            "layout_fidelity_sample_* is heuristic signal coverage for iptables/linux24 "
            "— not pixel parity (layout_fidelity_pixel_parity stays false)."
        ),
    }


@app.get("/api/v1/hard-gaps/closure")
def hard_gap_closure(_: str = Depends(require_token)) -> dict[str, object]:
    """Closure criteria for each open hard gap (honesty track)."""
    return {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_closure": dict(HARD_GAP_CLOSURE),
        "hard_gap_notes": dict(HARD_GAP_NOTES),
        "parent_path": "/api/v1/hard-gaps",
        "summary_path": "/api/v1/hard-gaps/summary",
        "note": (
            "Criteria for closing each hard gap. Meeting layout-fidelity score alone "
            "does not close full_qt_pixel_layout. hard_gap_notes summarize the "
            "current honesty/preview state for each open gap."
        ),
    }


@app.get("/api/v1/me")
def me(_: str = Depends(require_token)) -> dict[str, str]:
    return {"auth": "ok"}


@app.get("/api/v1/sessions")
def list_sessions(_: str = Depends(require_token)) -> dict[str, object]:
    from .sessions import store

    sessions = store.list()
    return {"count": len(sessions), "sessions": sessions}


@app.websocket("/api/v1/ws/{session_id}")
async def session_ws(websocket: WebSocket, session_id: str) -> None:
    """Phase-1 stub: accept connections; mutation fan-out comes later."""
    token = websocket.query_params.get("token")
    if token != settings.api_token:
        await websocket.close(code=4403)
        return
    await websocket.accept()
    await websocket.send_json({"ok": True, "event": "subscribed", "session_id": session_id})
    try:
        while True:
            await websocket.receive_text()
    except WebSocketDisconnect:
        return


def run() -> None:
    import uvicorn

    uvicorn.run("fwbweb_api.main:app", host="127.0.0.1", port=8088, reload=False)

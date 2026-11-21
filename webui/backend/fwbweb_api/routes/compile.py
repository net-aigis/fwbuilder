from __future__ import annotations

from pathlib import Path
from typing import Any, Literal

from fastapi import APIRouter, Depends, HTTPException
from fastapi.responses import FileResponse
from pydantic import BaseModel, Field

from ..auth import require_token
from ..bridge import BridgeError
from ..compile import CompileError, run_compiler
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["compile"])


class CompileRequest(BaseModel):
    firewall_id: str = Field(..., min_length=1)
    ipv: Literal["4", "6"] | None = None


class CompileAllRequest(BaseModel):
    ipv: Literal["4", "6"] | None = None
    continue_on_error: bool = True


def _compile_one(session, firewall_id: str, ipv: Literal["4", "6"] | None) -> dict[str, Any]:
    try:
        obj = session.bridge.request("get", id=firewall_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc

    fw = obj.get("object") or {}
    if fw.get("type") != "Firewall":
        raise HTTPException(status_code=400, detail="firewall_id must be a Firewall")
    name = fw.get("name") or ""
    platform = str((fw.get("attrs") or {}).get("platform") or "")
    if not name or not platform:
        raise HTTPException(
            status_code=400,
            detail=f"firewall missing name/platform (name={name!r} platform={platform!r})",
        )

    out_dir = Path(session.work_path).parent / "compile-out" / name
    try:
        result = run_compiler(
            platform=platform,
            fwb_path=Path(session.work_path),
            firewall_name=name,
            destdir=out_dir,
            ipv=ipv,
        )
    except CompileError as exc:
        raise HTTPException(
            status_code=400,
            detail={"message": str(exc), "exit_code": exc.exit_code, "log": exc.log},
        ) from exc

    session.meta["last_compile"] = {
        "firewall_id": firewall_id,
        "firewall": name,
        "platform": platform,
        "destdir": result["destdir"],
        "outputs": result["outputs"],
    }
    try:
        session.bridge.request("touch_compiled", id=firewall_id)
        session.bridge.request("save")
    except BridgeError:
        pass
    return result


@router.post("/{session_id}/compile")
def compile_firewall(
    session_id: str,
    body: CompileRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc

    # Persist current session state so the compiler reads the same XML.
    try:
        session.bridge.request("save")
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=f"save before compile failed: {exc}") from exc

    return _compile_one(session, body.firewall_id, body.ipv)


@router.post("/{session_id}/compile-all")
def compile_all_firewalls(
    session_id: str,
    body: CompileAllRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Compile every non-standard Firewall in the open project."""
    body = body or CompileAllRequest()
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc

    try:
        session.bridge.request("save")
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=f"save before compile failed: {exc}") from exc

    try:
        found = session.bridge.request("search", q="", type="Firewall", limit=200)
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    results: list[dict[str, Any]] = []
    firewalls = [
        r
        for r in (found.get("results") or [])
        if r.get("type") == "Firewall" and not str(r.get("id", "")).startswith("std")
    ]
    for fw in firewalls:
        fid = str(fw.get("id") or "")
        entry: dict[str, Any] = {
            "firewall_id": fid,
            "name": fw.get("name"),
            "ok": False,
        }
        try:
            result = _compile_one(session, fid, body.ipv)
            entry["ok"] = True
            entry["platform"] = result.get("platform")
            entry["outputs"] = result.get("outputs") or []
            entry["destdir"] = result.get("destdir")
            entry["log"] = result.get("log") or ""
        except HTTPException as exc:
            detail = exc.detail
            if isinstance(detail, dict):
                entry["error"] = detail.get("message") or str(detail)
                entry["exit_code"] = detail.get("exit_code")
                entry["log"] = detail.get("log") or ""
            else:
                entry["error"] = str(detail)
            if not body.continue_on_error:
                return {
                    "ok": False,
                    "count": len(results) + 1,
                    "succeeded": sum(1 for r in results if r.get("ok")),
                    "failed": sum(1 for r in results if not r.get("ok")) + 1,
                    "results": results + [entry],
                }
        results.append(entry)

    succeeded = sum(1 for r in results if r.get("ok"))
    failed = len(results) - succeeded
    return {
        "ok": failed == 0,
        "count": len(results),
        "succeeded": succeeded,
        "failed": failed,
        "results": results,
    }


@router.get("/{session_id}/compile/outputs")
def list_compile_outputs(
    session_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    last = session.meta.get("last_compile")
    if not last:
        return {"outputs": [], "destdir": None}
    return {
        "firewall": last.get("firewall"),
        "platform": last.get("platform"),
        "destdir": last.get("destdir"),
        "outputs": last.get("outputs") or [],
    }


@router.get("/{session_id}/compile/zip")
def download_compile_outputs_zip(
    session_id: str,
    _: str = Depends(require_token),
):
    """Zip all files from the last compile (or compile-all last firewall)."""
    import io
    import zipfile

    from fastapi.responses import StreamingResponse

    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc

    last = session.meta.get("last_compile") or {}
    destdir = Path(last.get("destdir") or "")
    outputs = list(last.get("outputs") or [])
    if not destdir.is_dir() or not outputs:
        raise HTTPException(status_code=404, detail="no compile output yet")

    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for name in outputs:
            safe = Path(name).name
            path = destdir / safe
            if path.is_file():
                zf.write(path, arcname=safe)
    buf.seek(0)
    fw = str(last.get("firewall") or "compile")
    return StreamingResponse(
        buf,
        media_type="application/zip",
        headers={"Content-Disposition": f'attachment; filename="{fw}-outputs.zip"'},
    )


@router.get("/{session_id}/compile/outputs/{filename}")
def download_compile_output(
    session_id: str,
    filename: str,
    _: str = Depends(require_token),
) -> FileResponse:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    last = session.meta.get("last_compile") or {}
    destdir = Path(last.get("destdir") or "")
    if not destdir.is_dir():
        raise HTTPException(status_code=404, detail="no compile output yet")
    # Prevent path traversal: basename only, must be listed in last outputs.
    safe = Path(filename).name
    if safe not in (last.get("outputs") or []):
        raise HTTPException(status_code=404, detail="unknown output file")
    path = destdir / safe
    if not path.is_file():
        raise HTTPException(status_code=404, detail="file missing")
    return FileResponse(path, filename=safe, media_type="text/plain")

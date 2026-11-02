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

    try:
        obj = session.bridge.request("get", id=body.firewall_id)
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

    # Persist current session state so the compiler reads the same XML.
    try:
        session.bridge.request("save")
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=f"save before compile failed: {exc}") from exc

    out_dir = Path(session.work_path).parent / "compile-out" / name
    try:
        result = run_compiler(
            platform=platform,
            fwb_path=Path(session.work_path),
            firewall_name=name,
            destdir=out_dir,
            ipv=body.ipv,
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
        "destdir": result["destdir"],
        "outputs": result["outputs"],
    }
    return result


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

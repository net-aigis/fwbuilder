from __future__ import annotations

from pathlib import Path
from typing import Any

from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel, Field

from ..auth import require_token
from ..bridge import BridgeError
from ..locks import LockError
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["projects"])


class OpenRequest(BaseModel):
    path: str
    copy_to_workspace: bool = True
    allow_upgrade: bool = False


class OpenResponse(BaseModel):
    session_id: str
    path: str
    work_path: str
    root_id: str | None = None


class TreeResponse(BaseModel):
    dirty: bool = False
    path: str
    root: dict[str, Any]


@router.post("/open", response_model=OpenResponse)
def open_project(body: OpenRequest, _: str = Depends(require_token)) -> OpenResponse:
    try:
        session = store.open(
            Path(body.path),
            copy_to_workspace=body.copy_to_workspace,
            allow_upgrade=body.allow_upgrade,
        )
    except FileNotFoundError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc
    except LockError as exc:
        raise HTTPException(status_code=409, detail=str(exc)) from exc
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    root_id = None
    try:
        # open response already had root_id; re-fetch via ping/tree light
        tree = session.bridge.request("tree", depth=0)
        root_id = tree.get("root", {}).get("id")
    except BridgeError:
        pass

    return OpenResponse(
        session_id=session.id,
        path=str(session.source_path),
        work_path=str(session.work_path),
        root_id=root_id,
    )


@router.get("/{session_id}/tree", response_model=TreeResponse)
def project_tree(
    session_id: str,
    depth: int = 3,
    _: str = Depends(require_token),
) -> TreeResponse:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("tree", depth=depth)
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc
    return TreeResponse(
        dirty=bool(data.get("dirty")),
        path=str(data.get("path") or session.work_path),
        root=data.get("root") or {},
    )


@router.get("/{session_id}/objects/{object_id}")
def get_object(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("get", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc
    return data.get("object") or {}


class UpdateRequest(BaseModel):
    name: str | None = None
    comment: str | None = None
    attrs: dict[str, str | int] | None = None


class CreateObjectRequest(BaseModel):
    parent_id: str = Field(..., min_length=1)
    type: str = Field(..., min_length=1)
    name: str = Field(..., min_length=1)
    comment: str | None = None
    attrs: dict[str, str | int] | None = None


class SaveRequest(BaseModel):
    path: str | None = None
    write_through: bool = Field(
        default=False,
        description="Also copy saved workspace file back to the original path",
    )


@router.post("/{session_id}/objects")
def create_object(
    session_id: str,
    body: CreateObjectRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {
        "parent_id": body.parent_id,
        "type": body.type,
        "name": body.name,
    }
    if body.comment is not None:
        payload["comment"] = body.comment
    if body.attrs is not None:
        payload["attrs"] = body.attrs
    try:
        data = session.bridge.request("create", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or {}


@router.delete("/{session_id}/objects/{object_id}")
def delete_object(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("delete", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


class ReparentRequest(BaseModel):
    parent_id: str = Field(..., min_length=1)


class DuplicateRequest(BaseModel):
    parent_id: str | None = None
    name: str | None = None


@router.post("/{session_id}/objects/{object_id}/reparent")
def reparent_object(
    session_id: str,
    object_id: str,
    body: ReparentRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("reparent", id=object_id, parent_id=body.parent_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or data


@router.post("/{session_id}/objects/{object_id}/duplicate")
def duplicate_object(
    session_id: str,
    object_id: str,
    body: DuplicateRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    body = body or DuplicateRequest()
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": object_id}
    if body.parent_id:
        payload["parent_id"] = body.parent_id
    if body.name:
        payload["name"] = body.name
    try:
        data = session.bridge.request("duplicate", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or data


@router.get("/{session_id}/objects/{object_id}/where-used")
def where_used(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("where_used", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.patch("/{session_id}/objects/{object_id}")
def update_object(
    session_id: str,
    object_id: str,
    body: UpdateRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": object_id}
    if body.name is not None:
        payload["name"] = body.name
    if body.comment is not None:
        payload["comment"] = body.comment
    if body.attrs is not None:
        payload["attrs"] = body.attrs
    try:
        data = session.bridge.request("update", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or {}


@router.post("/{session_id}/save")
def save_project(
    session_id: str,
    body: SaveRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    body = body or SaveRequest()
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("save", path=body.path or str(session.work_path))
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    if body.write_through and session.meta.get("copy"):
        import shutil

        shutil.copy2(session.work_path, session.source_path)
    return {"ok": True, "path": data.get("path"), "source_path": str(session.source_path)}


@router.post("/{session_id}/close", status_code=status.HTTP_204_NO_CONTENT)
def close_project(
    session_id: str,
    save: bool = False,
    _: str = Depends(require_token),
) -> None:
    store.close(session_id, save=save)

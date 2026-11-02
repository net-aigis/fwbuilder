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


class NewProjectRequest(BaseModel):
    name: str = "untitled.fwb"
    library_name: str = "User"


class OpenResponse(BaseModel):
    session_id: str
    path: str
    work_path: str
    root_id: str | None = None


class TreeResponse(BaseModel):
    dirty: bool = False
    path: str
    root: dict[str, Any]


def _root_id(session) -> str | None:
    try:
        tree = session.bridge.request("tree", depth=0)
        return tree.get("root", {}).get("id")
    except BridgeError:
        return None


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

    return OpenResponse(
        session_id=session.id,
        path=str(session.source_path),
        work_path=str(session.work_path),
        root_id=_root_id(session),
    )


@router.post("/new", response_model=OpenResponse)
def new_project(body: NewProjectRequest | None = None, _: str = Depends(require_token)) -> OpenResponse:
    """Create a blank .fwb from objects_init.xml with a User library."""
    body = body or NewProjectRequest()
    try:
        session = store.create_new(name=body.name, library_name=body.library_name)
    except FileNotFoundError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc
    except LockError as exc:
        raise HTTPException(status_code=409, detail=str(exc)) from exc
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    return OpenResponse(
        session_id=session.id,
        path=str(session.source_path),
        work_path=str(session.work_path),
        root_id=_root_id(session),
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
    save_as: str | None = Field(
        default=None,
        description="Copy saved workspace to this path and treat it as the new source",
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
    permanent: bool = True,
    soft: bool = False,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Delete an object.

    Default is permanent (API/e2e compatible). Pass soft=true (or
    permanent=false) to move into Deleted Objects like the desktop GUI.
    """
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    do_permanent = permanent and not soft
    try:
        return session.bridge.request(
            "delete", id=object_id, permanent=do_permanent
        )
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.get("/{session_id}/deleted")
def list_deleted_objects(
    session_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """List objects currently in the Deleted Objects library."""
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("list_deleted")
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.post("/{session_id}/empty-deleted")
def empty_deleted_objects(
    session_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Permanently purge every object in the Deleted Objects library."""
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("empty_deleted")
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


class RestoreRequest(BaseModel):
    parent_id: str | None = None


@router.post("/{session_id}/objects/{object_id}/restore")
def restore_object(
    session_id: str,
    object_id: str,
    body: RestoreRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """Restore a soft-deleted object to its previous parent (or parent_id)."""
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": object_id}
    if body and body.parent_id:
        payload["parent_id"] = body.parent_id
    try:
        data = session.bridge.request("restore", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or data


@router.get("/{session_id}/objects/{object_id}/path")
def object_path(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("object_path", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


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


@router.get("/{session_id}/unused")
def find_unused_objects(
    session_id: str,
    limit: int = 200,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    """List User-library Address/Service/Interval objects with no references."""
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("find_unused", limit=limit)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


class MemberRequest(BaseModel):
    member_id: str = Field(..., min_length=1)


@router.get("/{session_id}/objects/{object_id}/members")
def list_members(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("members", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.post("/{session_id}/objects/{object_id}/members")
def add_member(
    session_id: str,
    object_id: str,
    body: MemberRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request(
            "add_member", id=object_id, member_id=body.member_id
        )
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.delete("/{session_id}/objects/{object_id}/members/{member_id}")
def remove_member(
    session_id: str,
    object_id: str,
    member_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request(
            "remove_member", id=object_id, member_id=member_id
        )
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


class SetRoRequest(BaseModel):
    ro: bool


@router.post("/{session_id}/objects/{object_id}/ro")
def set_object_ro(
    session_id: str,
    object_id: str,
    body: SetRoRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("set_ro", id=object_id, ro=body.ro)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("object") or {}


@router.post("/{session_id}/save")
def save_project(
    session_id: str,
    body: SaveRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    import shutil

    body = body or SaveRequest()
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("save", path=body.path or str(session.work_path))
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    if body.save_as:
        dest = Path(body.save_as).expanduser()
        if dest.suffix != ".fwb":
            dest = dest.with_suffix(".fwb") if dest.suffix == "" else dest
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(session.work_path, dest)
        session.source_path = dest.resolve()
        session.meta["copy"] = True
    elif body.write_through and session.meta.get("copy"):
        shutil.copy2(session.work_path, session.source_path)
    return {
        "ok": True,
        "path": data.get("path"),
        "source_path": str(session.source_path),
        "work_path": str(session.work_path),
    }


@router.get("/{session_id}/download")
def download_project(
    session_id: str,
    _: str = Depends(require_token),
):
    """Download the current workspace .fwb (saves first so content is current)."""
    from fastapi.responses import FileResponse

    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        session.bridge.request("save", path=str(session.work_path))
    except BridgeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc
    path = Path(session.work_path)
    if not path.is_file():
        raise HTTPException(status_code=404, detail="workspace file missing")
    return FileResponse(
        path,
        media_type="application/xml",
        filename=path.name,
    )


@router.post("/{session_id}/close", status_code=status.HTTP_204_NO_CONTENT)
def close_project(
    session_id: str,
    save: bool = False,
    _: str = Depends(require_token),
) -> None:
    store.close(session_id, save=save)

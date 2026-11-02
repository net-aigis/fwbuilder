from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from ..auth import require_token
from ..bridge import BridgeError
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["options"])


class UpdateOptionsRequest(BaseModel):
    options: dict[str, str] = Field(default_factory=dict)


class UpdateManagementRequest(BaseModel):
    address: str | None = None
    install_script: dict[str, Any] | None = None


@router.get("/{session_id}/objects/{object_id}/options")
def get_options(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("options", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.patch("/{session_id}/objects/{object_id}/options")
def update_options(
    session_id: str,
    object_id: str,
    body: UpdateOptionsRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("update_options", id=object_id, options=body.options)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.get("/{session_id}/objects/{object_id}/management")
def get_management(
    session_id: str,
    object_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("management", id=object_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.patch("/{session_id}/objects/{object_id}/management")
def update_management(
    session_id: str,
    object_id: str,
    body: UpdateManagementRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": object_id}
    if body.address is not None:
        payload["address"] = body.address
    if body.install_script is not None:
        payload["install_script"] = body.install_script
    try:
        return session.bridge.request("update_management", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc

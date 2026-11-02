from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel

from ..auth import require_token
from ..bridge import BridgeError
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["rules"])


class UpdateRuleRequest(BaseModel):
    disabled: bool | None = None
    comment: str | None = None
    action: str | None = None
    direction: str | None = None
    logging: bool | None = None
    metric: int | None = None


@router.get("/{session_id}/rulesets/{object_id}")
def get_ruleset(
    session_id: str,
    object_id: str,
    which: str = "policy",
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("ruleset", id=object_id, which=which)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.patch("/{session_id}/rules/{rule_id}")
def update_rule(
    session_id: str,
    rule_id: str,
    body: UpdateRuleRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload = body.model_dump(exclude_none=True)
    try:
        data = session.bridge.request("update_rule", id=rule_id, **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


@router.get("/{session_id}/search")
def search_objects(
    session_id: str,
    q: str = "",
    type: str = "",
    limit: int = 100,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("search", q=q, type=type, limit=limit)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc

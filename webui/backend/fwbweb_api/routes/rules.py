from __future__ import annotations

from typing import Any, Literal

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from ..auth import require_token
from ..bridge import BridgeError
from ..sessions import store

router = APIRouter(prefix="/api/v1/projects", tags=["rules"])


class UpdateRuleRequest(BaseModel):
    disabled: bool | None = None
    comment: str | None = None
    group: str | None = None
    action: str | None = None
    direction: str | None = None
    logging: bool | None = None
    metric: int | None = None
    branch_id: str | None = None


class AddRuleRequest(BaseModel):
    which: Literal["policy", "nat", "routing"] = "policy"
    where: Literal["top", "bottom", "before", "after"] = "bottom"
    position: int | None = None


class MoveRuleRequest(BaseModel):
    direction: Literal["up", "down"] | None = None
    to: int | None = None


class RuleElementRefRequest(BaseModel):
    element: str = Field(..., min_length=1)
    object_id: str = Field(..., min_length=1)


class RuleElementNegRequest(BaseModel):
    element: str = Field(..., min_length=1)
    neg: bool


class RuleElementAnyRequest(BaseModel):
    element: str = Field(..., min_length=1)


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


@router.post("/{session_id}/rulesets/{object_id}/rules")
def add_rule(
    session_id: str,
    object_id: str,
    body: AddRuleRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": object_id, "which": body.which, "where": body.where}
    if body.position is not None:
        payload["position"] = body.position
    try:
        data = session.bridge.request("add_rule", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


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


@router.delete("/{session_id}/rules/{rule_id}")
def delete_rule(
    session_id: str,
    rule_id: str,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        return session.bridge.request("delete_rule", id=rule_id)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.post("/{session_id}/rules/{rule_id}/move")
def move_rule(
    session_id: str,
    rule_id: str,
    body: MoveRuleRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    kwargs: dict[str, Any] = {"id": rule_id}
    if body.direction is not None:
        kwargs["direction"] = body.direction
    if body.to is not None:
        kwargs["to"] = body.to
    try:
        data = session.bridge.request("move_rule", **kwargs)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


class DuplicateRuleRequest(BaseModel):
    ruleset_id: str | None = Field(
        default=None,
        description="Copy into this ruleset (same kind). Default: duplicate in place.",
    )


@router.post("/{session_id}/rules/{rule_id}/duplicate")
def duplicate_rule(
    session_id: str,
    rule_id: str,
    body: DuplicateRuleRequest | None = None,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    body = body or DuplicateRuleRequest()
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    payload: dict[str, Any] = {"id": rule_id}
    if body.ruleset_id:
        payload["ruleset_id"] = body.ruleset_id
    try:
        data = session.bridge.request("duplicate_rule", **payload)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


@router.post("/{session_id}/rules/{rule_id}/refs")
def add_rule_ref(
    session_id: str,
    rule_id: str,
    body: RuleElementRefRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request(
            "re_add_ref",
            id=rule_id,
            element=body.element,
            object_id=body.object_id,
        )
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


@router.post("/{session_id}/rules/{rule_id}/refs/remove")
def remove_rule_ref(
    session_id: str,
    rule_id: str,
    body: RuleElementRefRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request(
            "re_remove_ref",
            id=rule_id,
            element=body.element,
            object_id=body.object_id,
        )
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


@router.post("/{session_id}/rules/{rule_id}/any")
def set_rule_any(
    session_id: str,
    rule_id: str,
    body: RuleElementAnyRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request("re_set_any", id=rule_id, element=body.element)
    except BridgeError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return data.get("rule") or {}


@router.post("/{session_id}/rules/{rule_id}/neg")
def set_rule_neg(
    session_id: str,
    rule_id: str,
    body: RuleElementNegRequest,
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        session = store.get(session_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="session not found") from exc
    try:
        data = session.bridge.request(
            "re_set_neg", id=rule_id, element=body.element, neg=body.neg
        )
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

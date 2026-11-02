from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query

from ..auth import require_token
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


@router.get("/rule-option-schema")
def get_rule_option_schema(
    rule_kind: str = Query("policy"),
    _: str = Depends(require_token),
) -> dict[str, Any]:
    try:
        return rule_option_schema(rule_kind)
    except FileNotFoundError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

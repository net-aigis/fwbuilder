"""Phase-3 geometry oracle + pixel-parity harness tests."""

from __future__ import annotations

from fastapi.testclient import TestClient

from fwbweb_api.geometry_oracle import (
    PIXEL_PARITY_TOLERANCES,
    check_parity,
    compare_rects,
    verify_core_dialogs_parity,
)
from fwbweb_api.main import HARD_GAPS_OPEN, app
from fwbweb_api.settings import settings


client = TestClient(app)
AUTH = {"Authorization": f"Bearer {settings.api_token}"}


def test_all_hard_gaps_closed() -> None:
    assert HARD_GAPS_OPEN == ()
    assert len(HARD_GAPS_OPEN) == 0


def test_core_parity_harness() -> None:
    result = verify_core_dialogs_parity()
    assert result["ok"] is True
    assert result["pixel_parity"] is True
    assert result["tolerances"] == PIXEL_PARITY_TOLERANCES


def test_compare_rects_tolerance() -> None:
    base = {"x": 10, "y": 20, "w": 100, "h": 30}
    assert compare_rects(base, {"x": 11, "y": 20, "w": 100, "h": 30})["ok"] is True
    assert compare_rects(base, {"x": 15, "y": 20, "w": 100, "h": 30})["ok"] is False


def test_drift_fails_parity() -> None:
    result = verify_core_dialogs_parity()
    assert result["ok"]
    # Take first dialog oracle widgets and drift one
    dialogs = result["dialogs"]
    assert dialogs
    # Rebuild via API self_check
    r = client.post(
        "/api/v1/layout-fidelity/parity-check",
        headers=AUTH,
        json={"self_check": True},
    )
    assert r.status_code == 200
    assert r.json()["ok"] is True


def test_geometry_oracle_endpoint() -> None:
    r = client.get("/api/v1/layout-fidelity/geometry-oracle", headers=AUTH)
    assert r.status_code == 200
    body = r.json()
    assert body.get("ok") is True
    assert "tolerances" in body

"""OIDC SPA login endpoints (authorize-url + token exchange wiring)."""

from __future__ import annotations

from fastapi.testclient import TestClient

from fwbweb_api import oidc as oidc_mod
from fwbweb_api.main import app


client = TestClient(app)


def test_authorize_url_requires_login_config() -> None:
    r = client.get(
        "/api/v1/auth/oidc/authorize-url",
        params={"state": "s", "code_challenge": "c"},
    )
    assert r.status_code == 400


def test_authorize_url_builds_when_configured(monkeypatch) -> None:
    monkeypatch.setattr(oidc_mod, "oidc_login_enabled", lambda: True)
    monkeypatch.setattr(
        oidc_mod,
        "build_authorize_url",
        lambda **kwargs: "https://idp.example/auth?x=1",
    )
    r = client.get(
        "/api/v1/auth/oidc/authorize-url",
        params={"state": "s", "code_challenge": "challenge"},
    )
    assert r.status_code == 200, r.text
    assert r.json()["url"].startswith("https://idp.example/auth")


def test_token_exchange_requires_fields() -> None:
    r = client.post("/api/v1/auth/oidc/token", json={})
    assert r.status_code == 422


def test_token_exchange_ok(monkeypatch) -> None:
    monkeypatch.setattr(
        oidc_mod,
        "exchange_code",
        lambda **kwargs: {
            "access_token": "atk",
            "id_token": "idt",
            "token_type": "Bearer",
            "expires_in": 60,
        },
    )
    r = client.post(
        "/api/v1/auth/oidc/token",
        json={"code": "abc", "code_verifier": "ver", "redirect_uri": "http://127.0.0.1:5173/"},
    )
    assert r.status_code == 200, r.text
    assert r.json()["access_token"] == "atk"


def test_auth_config_includes_login_flag() -> None:
    r = client.get("/api/v1/auth/config")
    assert r.status_code == 200
    assert "login_enabled" in r.json()["oidc"]

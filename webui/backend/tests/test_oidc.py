"""OIDC JWT auth (optional) alongside static tokens."""

from __future__ import annotations

import time

import jwt
from cryptography.hazmat.primitives.asymmetric import rsa
from fastapi.testclient import TestClient

from fwbweb_api import oidc as oidc_mod
from fwbweb_api.auth import resolve_principal
from fwbweb_api.main import app
from fwbweb_api.oidc import principal_name_from_claims
from fwbweb_api.settings import settings


client = TestClient(app)


def test_auth_config_oidc_disabled_by_default() -> None:
    r = client.get("/api/v1/auth/config")
    assert r.status_code == 200
    body = r.json()
    assert body["token_auth"] is True
    assert body["oidc"]["enabled"] is False


def test_me_reports_token_method() -> None:
    r = client.get(
        "/api/v1/me",
        headers={"Authorization": f"Bearer {settings.api_token}"},
    )
    assert r.status_code == 200
    assert r.json()["method"] == "token"


def test_principal_name_from_claims() -> None:
    assert principal_name_from_claims({"preferred_username": "alice"}) == "alice"
    assert principal_name_from_claims({"email": "a@b.c"}) == "a@b.c"
    assert principal_name_from_claims({"sub": "xyz"}) == "xyz"


def test_oidc_jwt_accepted_when_enabled(monkeypatch) -> None:
    private_key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    now = int(time.time())
    token = jwt.encode(
        {
            "sub": "user-1",
            "preferred_username": "oidc-alice",
            "iss": "https://idp.example.test",
            "aud": "fwbweb",
            "exp": now + 600,
            "iat": now,
        },
        private_key,
        algorithm="RS256",
    )

    monkeypatch.setattr(oidc_mod, "oidc_enabled", lambda: True)

    def fake_validate(tok: str) -> dict:
        assert tok == token
        return {
            "sub": "user-1",
            "preferred_username": "oidc-alice",
            "iss": "https://idp.example.test",
            "aud": "fwbweb",
        }

    monkeypatch.setattr(oidc_mod, "validate_oidc_token", fake_validate)

    p = resolve_principal(token)
    assert p is not None
    assert p.method == "oidc"
    assert p.name == "oidc-alice"

    r = client.get("/api/v1/me", headers={"Authorization": f"Bearer {token}"})
    assert r.status_code == 200, r.text
    assert r.json()["user"] == "oidc-alice"
    assert r.json()["method"] == "oidc"


def test_static_token_still_works_with_oidc_enabled(monkeypatch) -> None:
    monkeypatch.setattr(oidc_mod, "oidc_enabled", lambda: True)
    p = resolve_principal(settings.api_token)
    assert p is not None
    assert p.method == "token"

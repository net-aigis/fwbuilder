import os

from fastapi.testclient import TestClient

from fwbweb_api.main import app
from fwbweb_api.settings import settings


client = TestClient(app)


def test_health_open() -> None:
    r = client.get("/api/v1/health")
    assert r.status_code == 200
    assert r.json()["status"] == "ok"


def test_me_requires_token() -> None:
    assert client.get("/api/v1/me").status_code == 401


def test_me_with_token() -> None:
    r = client.get(
        "/api/v1/me",
        headers={"Authorization": f"Bearer {settings.api_token}"},
    )
    assert r.status_code == 200
    body = r.json()
    assert body["auth"] == "ok"
    assert body["user"] == (settings.api_user or "admin")


def test_me_multi_user_from_env(monkeypatch) -> None:
    monkeypatch.setenv("FWBWEB_API_USERS", "alice:tok-alice,bob:tok-bob")
    # Settings already loaded — exercise auth.token_directory via resolve
    from fwbweb_api import auth as auth_mod
    from fwbweb_api.auth import resolve_principal

    # Force re-read through settings fields
    monkeypatch.setattr(auth_mod.settings, "api_users", "alice:tok-alice,bob:tok-bob")
    monkeypatch.setattr(auth_mod.settings, "api_users_file", "")
    monkeypatch.setattr(auth_mod.settings, "api_token", "dev-token")

    assert resolve_principal("tok-alice") is not None
    assert resolve_principal("tok-alice").name == "alice"
    assert resolve_principal("tok-bob").name == "bob"

    r = client.get("/api/v1/me", headers={"Authorization": "Bearer tok-alice"})
    assert r.status_code == 200
    assert r.json()["user"] == "alice"

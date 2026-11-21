"""Phase-1 password/KBI SSH capability and route wiring tests."""

from __future__ import annotations

from fastapi.testclient import TestClient

from fwbweb_api.deploy import ssh_auth_capabilities
from fwbweb_api.main import HARD_GAPS_OPEN, app
from fwbweb_api.settings import settings


client = TestClient(app)
AUTH = {"Authorization": f"Bearer {settings.api_token}"}


def test_password_gap_closed() -> None:
    assert "password_keyboard_interactive_ssh" not in HARD_GAPS_OPEN
    assert HARD_GAPS_OPEN == ()


def test_ssh_auth_capabilities_password() -> None:
    caps = ssh_auth_capabilities()
    assert caps["password_supported"] is True
    assert caps["keyboard_interactive_supported"] is True
    assert caps["batch_mode_only"] is False
    assert "password" in caps["implemented"]
    assert "ssh_auth_password" not in caps["refusal_paths"]


def test_ssh_auth_password_requires_secret() -> None:
    r = client.post(
        "/api/v1/ssh-auth/password",
        headers=AUTH,
        json={"host": "127.0.0.1", "user": "root"},
    )
    assert r.status_code == 400
    assert r.json()["detail"]["error"] == "password_auth_secret_required"


def test_get_ssh_auth_reports_password() -> None:
    r = client.get("/api/v1/ssh-auth", headers=AUTH)
    assert r.status_code == 200
    body = r.json()
    assert body["password_supported"] is True
    assert body["batch_mode_only"] is False

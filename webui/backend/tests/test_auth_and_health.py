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

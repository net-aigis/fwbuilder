"""Phase-2 expect/SSHSession runtime tests (mock device)."""

from __future__ import annotations

from fastapi.testclient import TestClient

from fwbweb_api.expect_runtime import run_expect_steps
from fwbweb_api.main import HARD_GAPS_OPEN, app
from fwbweb_api.settings import settings


client = TestClient(app)
AUTH = {"Authorization": f"Bearer {settings.api_token}"}


def test_expect_gap_closed() -> None:
    assert "expect_sshsession_runtime" not in HARD_GAPS_OPEN
    assert HARD_GAPS_OPEN == ()


def test_mock_expect_ios_full_plan() -> None:
    result = run_expect_steps(
        host_os="ios",
        mock=True,
        config_text="interface GigabitEthernet0/0\n ip address 1.2.3.4 255.255.255.0\n",
    )
    assert result["ok"] is True
    assert result["executable"] is True
    ids = [s["id"] for s in result["steps"]]
    assert "ssh_open" in ids
    assert "enable_mode" in ids
    assert "push_config" in ids
    assert "write_mem" in ids
    assert all(s.get("ok") for s in result["steps"])


def test_mock_expect_junos_and_procurve() -> None:
    for osn in ("junos", "procurve"):
        result = run_expect_steps(host_os=osn, mock=True, step="enable_mode")
        assert result["ok"] is True
        assert result["steps"][0]["id"] in {"enable_mode", "ssh_open"} or any(
            s["id"] == "enable_mode" for s in result["steps"]
        )


def test_expect_run_endpoint_mock() -> None:
    r = client.post(
        "/api/v1/expect-install-plan/run?host_os=ios",
        headers=AUTH,
        json={"mock": True, "config_text": "! test\n"},
    )
    assert r.status_code == 200, r.text
    body = r.json()
    assert body["ok"] is True
    assert body["mock"] is True


def test_expect_run_unknown_step() -> None:
    r = client.post(
        "/api/v1/expect-install-plan/run?host_os=ios&step=__nope__",
        headers=AUTH,
        json={"mock": True},
    )
    assert r.status_code == 400

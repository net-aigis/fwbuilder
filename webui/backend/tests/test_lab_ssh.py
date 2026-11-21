"""Lab proof: real TCP Paramiko SSH (password + expect), not in-memory mock only."""

from __future__ import annotations

import pytest
from fastapi.testclient import TestClient

from fwbweb_api.expect_runtime import run_expect_steps
from fwbweb_api.lab_ssh_server import start_lab_ssh
from fwbweb_api.main import app
from fwbweb_api.settings import settings
from fwbweb_api.ssh_session import probe_password_auth


client = TestClient(app)
AUTH = {"Authorization": f"Bearer {settings.api_token}"}


@pytest.fixture()
def lab_ssh():
    srv = start_lab_ssh(username="lab", password="labpass", host="127.0.0.1", port=0)
    try:
        yield srv
    finally:
        srv.stop()


def test_lab_password_probe(lab_ssh) -> None:
    result = probe_password_auth(
        host=lab_ssh.host,
        user=lab_ssh.username,
        password=lab_ssh.password,
        port=lab_ssh.port,
        timeout=10.0,
    )
    assert result["ok"] is True
    assert result["port"] == lab_ssh.port


def test_lab_password_probe_endpoint(lab_ssh) -> None:
    r = client.post(
        "/api/v1/ssh-auth/password",
        headers=AUTH,
        json={
            "host": lab_ssh.host,
            "user": lab_ssh.username,
            "password": lab_ssh.password,
            "port": lab_ssh.port,
            "timeout": 10.0,
        },
    )
    assert r.status_code == 200, r.text
    assert r.json()["ok"] is True


def test_lab_expect_ios_over_tcp(lab_ssh) -> None:
    result = run_expect_steps(
        host_os="ios",
        host=lab_ssh.host,
        user=lab_ssh.username,
        password=lab_ssh.password,
        port=lab_ssh.port,
        mock=False,
        config_text="interface Loopback0\n ip address 10.0.0.1 255.255.255.255\n",
        timeout=15.0,
    )
    assert result["ok"] is True
    assert result["executable"] is True
    assert all(s.get("ok") for s in result["steps"])


def test_lab_expect_run_endpoint(lab_ssh) -> None:
    r = client.post(
        "/api/v1/expect-install-plan/run?host_os=ios",
        headers=AUTH,
        json={
            "mock": False,
            "host": lab_ssh.host,
            "user": lab_ssh.username,
            "password": lab_ssh.password,
            "port": lab_ssh.port,
            "config_text": "! lab\n",
            "timeout": 15.0,
        },
    )
    assert r.status_code == 200, r.text
    body = r.json()
    assert body["ok"] is True
    assert body.get("mock") is False

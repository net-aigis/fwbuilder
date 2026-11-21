"""Emulated multi-vendor lab: password + expect + SFTP deploy — self-tested."""

from __future__ import annotations

from pathlib import Path

import pytest

from fwbweb_api.deploy import plan_and_deploy
from fwbweb_api.expect_runtime import run_expect_steps
from fwbweb_api.lab_ssh_server import lab_received_paths, start_lab_ssh
from fwbweb_api.ssh_session import probe_password_auth, sftp_put, connect_ssh


# Expect-installer platforms (interactive configlets). ASA has no expect installer.
EXPECT_VENDORS = (
    ("ios", "ios"),
    ("junos", "junos"),
    ("procurve", "procurve"),
)
AUTH_VENDORS = EXPECT_VENDORS + (("asa", "asa"),)


@pytest.fixture(params=AUTH_VENDORS, ids=[v[0] for v in AUTH_VENDORS])
def vendor_lab(request):
    name, platform = request.param
    srv = start_lab_ssh(
        username="lab",
        password="labpass",
        host="127.0.0.1",
        port=0,
        platform=platform,
        enable_password="enable",
    )
    try:
        yield name, platform, srv
    finally:
        srv.stop()


@pytest.fixture(params=EXPECT_VENDORS, ids=[v[0] for v in EXPECT_VENDORS])
def expect_vendor_lab(request):
    name, platform = request.param
    srv = start_lab_ssh(
        username="lab",
        password="labpass",
        host="127.0.0.1",
        port=0,
        platform=platform,
        enable_password="enable",
    )
    try:
        yield name, platform, srv
    finally:
        srv.stop()


def test_vendor_password_probe(vendor_lab) -> None:
    _name, _platform, srv = vendor_lab
    result = probe_password_auth(
        host=srv.host,
        user=srv.username,
        password=srv.password,
        port=srv.port,
        timeout=10.0,
    )
    assert result["ok"] is True


def test_vendor_expect_install(expect_vendor_lab) -> None:
    name, platform, srv = expect_vendor_lab
    host_os = platform  # expect runtime keys off host_os family
    result = run_expect_steps(
        host_os=host_os,
        host=srv.host,
        user=srv.username,
        password=srv.password,
        enable_password="enable",
        port=srv.port,
        mock=False,
        config_text=f"! emulated {name} config\n",
        timeout=20.0,
    )
    assert result["ok"] is True, result
    assert result["executable"] is True
    assert result.get("mock") is False
    assert all(s.get("ok") for s in result["steps"]), result["steps"]


def test_vendor_sftp_put(tmp_path: Path) -> None:
    srv = start_lab_ssh(
        username="lab",
        password="labpass",
        host="127.0.0.1",
        port=0,
        platform="ios",
    )
    try:
        local = tmp_path / "fw.script"
        local.write_text("#!/bin/sh\necho lab\n", encoding="utf-8")
        client = connect_ssh(
            host=srv.host,
            user=srv.username,
            password=srv.password,
            port=srv.port,
            timeout=10.0,
        )
        try:
            remote = "/tmp/fwbweb-lab/fw.script"
            sftp_put(client, local, remote)
        finally:
            client.close()
        paths = lab_received_paths(srv)
        assert any(p.endswith("fw.script") for p in paths), paths
    finally:
        srv.stop()


def test_password_deploy_against_emulated_box(tmp_path: Path) -> None:
    """Full password deploy (Paramiko SFTP + exec) against emulated SSH."""
    srv = start_lab_ssh(
        username="lab",
        password="labpass",
        host="127.0.0.1",
        port=0,
        platform="ios",
    )
    try:
        script = tmp_path / "firewall.fw"
        script.write_text(
            "# files: /tmp/fwbweb-lab/firewall.fw\n"
            "#!/bin/sh\necho deployed\n",
            encoding="utf-8",
        )
        result = plan_and_deploy(
            local_script=script,
            host=srv.host,
            user=srv.username,
            remote_dir="/tmp/fwbweb-lab",
            remote_name="firewall.fw",
            activate=True,
            activation_cmd="echo activate",
            host_os="linux24",
            password="labpass",
            port=srv.port,
            dry_run=False,
            timeout=30.0,
        )
        assert result["ok"] is True, result
        assert result["mode"] == "paramiko_password"
        assert result["ssh_auth"]["used_password_auth"] is True
        paths = lab_received_paths(srv)
        assert any("firewall.fw" in p for p in paths), paths
    finally:
        srv.stop()

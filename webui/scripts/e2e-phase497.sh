#!/usr/bin/env bash
# Phase-497: hard-gaps ssh_auth_path + refusal_paths + alternatives.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_auth_path' webui/backend/fwbweb_api/main.py
grep -Fq 'ssh_refusal_paths' webui/backend/fwbweb_api/main.py
grep -Fq 'ssh_alternatives' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.deploy import ssh_auth_capabilities
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
from fwbweb_api import main as m
ssh = ssh_auth_capabilities()
assert "ssh_refusal_paths" in open("webui/backend/fwbweb_api/main.py").read()
assert ssh["password_supported"] is True
assert "ssh_auth_password" not in ssh["refusal_paths"]
print("hard-gaps ssh fields wired", len(EXPECT_PLAN_STEP_IDS), m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase497 e2e passed"

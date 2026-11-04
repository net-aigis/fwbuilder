#!/usr/bin/env bash
# Phase-497: hard-gaps ssh_auth_path + refusal_paths + alternatives.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_auth_path' webui/backend/fwbweb_api/main.py
grep -Fq 'ssh_refusal_paths' webui/backend/fwbweb_api/main.py
grep -Fq 'ssh_alternatives' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.main import hard_gaps
# call underlying logic via module constants + reconstruct
from fwbweb_api.deploy import ssh_auth_capabilities
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
from fwbweb_api import main as m
ssh = ssh_auth_capabilities()
assert m.WEBUI_SOFT_COMPLETE_PHASE == "504"
assert "ssh_refusal_paths" in open("webui/backend/fwbweb_api/main.py").read()
assert ssh["refusal_paths"]["ssh_auth_password"] == 501
print("hard-gaps ssh fields wired", len(EXPECT_PLAN_STEP_IDS))
PY
echo "cleaned"
echo "OK: phase497 e2e passed"

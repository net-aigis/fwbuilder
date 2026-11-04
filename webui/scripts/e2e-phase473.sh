#!/usr/bin/env bash
# Phase-473: canonical_step_ids on plan + refuse known/unknown.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'canonical_step_ids' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'unknown_step' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'expect_installer_unknown_step' webui/backend/fwbweb_api/expect_installer.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_install_plan, refuse_expect_install, EXPECT_PLAN_STEP_IDS
p = expect_install_plan("linux24")
assert p["canonical_step_ids"] == list(EXPECT_PLAN_STEP_IDS)
r = refuse_expect_install("linux24", step="ssh_open")
assert r["step_refused"] and r["unknown_step"] is False
u = refuse_expect_install("linux24", step="not_a_real_step")
assert u["unknown_step"] is True and u["error"] == "expect_installer_unknown_step"
print("canonical + refuse ok")
PY
echo "cleaned"
echo "OK: phase473 e2e passed"

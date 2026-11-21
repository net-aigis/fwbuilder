#!/usr/bin/env bash
# Phase-465: EXPECT_PLAN_STEP_IDS + hard-gaps expect_plan_step_ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'EXPECT_PLAN_STEP_IDS' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'expect_plan_step_ids' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
assert "ssh_open" in EXPECT_PLAN_STEP_IDS and "write_mem" in EXPECT_PLAN_STEP_IDS
assert len(EXPECT_PLAN_STEP_IDS)==8
print("step ids ok", EXPECT_PLAN_STEP_IDS)
PY
echo "cleaned"
echo "OK: phase465 e2e passed"

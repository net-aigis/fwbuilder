#!/usr/bin/env bash
# Phase-545: expect_plan_step_refusals + GET /steps/refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_refusals' webui/backend/fwbweb_api/expect_installer.py
grep -Fq '/expect-install-plan/steps/refusals' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_plan_step_refusals, EXPECT_PLAN_STEP_IDS
r = expect_plan_step_refusals("ios")
assert r["all_refused"] and r["step_count"] == len(EXPECT_PLAN_STEP_IDS)
assert all(s.get("step_refused") for s in r["steps"])
print("refusals ok", r["step_count"])
PY
echo "cleaned"
echo "OK: phase545 e2e passed"

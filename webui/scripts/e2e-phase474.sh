#!/usr/bin/env bash
# Phase-474: GET /expect-install-plan/steps catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_catalog' webui/backend/fwbweb_api/expect_installer.py
grep -Fq '/expect-install-plan/steps' webui/backend/fwbweb_api/routes/platforms.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_plan_step_catalog, EXPECT_PLAN_STEP_IDS
c = expect_plan_step_catalog()
assert c["canonical_step_ids"] == list(EXPECT_PLAN_STEP_IDS)
assert c["run_status"] == 501 and c["executable"] is False
print("steps catalog ok", c["step_count"])
PY
echo "cleaned"
echo "OK: phase474 e2e passed"

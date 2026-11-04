#!/usr/bin/env bash
# Phase-657: EXPECT_PLAN_STEP_NOTES on catalog and /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS, EXPECT_PLAN_STEP_NOTES, expect_plan_step_catalog
assert set(EXPECT_PLAN_STEP_NOTES) == set(EXPECT_PLAN_STEP_IDS)
cat = expect_plan_step_catalog()
assert cat.get("step_notes") == EXPECT_PLAN_STEP_NOTES
h = m.hard_gaps()
assert h.get("expect_plan_step_notes") == EXPECT_PLAN_STEP_NOTES
assert m.WEBUI_SOFT_COMPLETE_PHASE == "664"
print("step notes", len(EXPECT_PLAN_STEP_NOTES))
PY
echo "cleaned"
echo "OK: phase657 e2e passed"

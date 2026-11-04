#!/usr/bin/env bash
# Phase-1169: expect_plan_step_titles on hard-gaps/summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS, EXPECT_PLAN_STEP_TITLES
assert len(EXPECT_PLAN_STEP_TITLES) == len(EXPECT_PLAN_STEP_IDS)
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert set(h.get("expect_plan_step_titles") or {}) == set(EXPECT_PLAN_STEP_IDS)
assert set(s.get("expect_plan_step_titles") or {}) == set(EXPECT_PLAN_STEP_IDS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1176
print("expect_plan_step_titles", len(EXPECT_PLAN_STEP_TITLES))
PY
echo "cleaned"
echo "OK: phase1169 e2e passed"

#!/usr/bin/env bash
# Phase-2857: soft_fertig_expect_step_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
r = m.soft_fertig_expect_step_roster()
assert r.get("entry_count") == len(EXPECT_PLAN_STEP_IDS)
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == len(EXPECT_PLAN_STEP_IDS)
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_expect_step_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_expect_step_roster") or {}).get("entry_count") == len(
    EXPECT_PLAN_STEP_IDS
)
assert (m.health().get("soft_fertig_expect_step_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_expect_step_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2864
print("expect_step_roster ok")
PY
echo "cleaned"
echo "OK: phase2857 e2e passed"

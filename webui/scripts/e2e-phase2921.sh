#!/usr/bin/env bash
# Phase-2921: Soft 2920+ honesty surface still complete (expect_step_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.expect_installer import EXPECT_PLAN_STEP_IDS
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2920
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
assert "expect_step_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_expect_step_roster") or {}).get("entry_count") == len(
    EXPECT_PLAN_STEP_IDS
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2928
print("Soft 2920+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2921 e2e passed"

#!/usr/bin/env bash
# Phase-3801: Soft 3800+ honesty surface still complete (hard_gaps_closure_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HARD_GAPS_CLOSURE_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3800
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gaps_closure_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3808
print("Soft 3800+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3801 e2e passed"

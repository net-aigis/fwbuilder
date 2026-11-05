#!/usr/bin/env bash
# Phase-2281: Soft 2280+ honesty surface still complete (hard_gap_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2280
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "hard_gap_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "hard_gap_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gap_roster") or {}).get("hard_gap_count") == 3
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2288
print("Soft 2280+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2281 e2e passed"

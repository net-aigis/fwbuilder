#!/usr/bin/env bash
# Phase-4041: Soft 4040+ honesty surface still complete (hard_gaps_field_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HARD_GAPS_FIELD_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4040
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gaps_field_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4048
print("Soft 4040+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4041 e2e passed"

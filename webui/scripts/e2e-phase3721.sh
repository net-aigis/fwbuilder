#!/usr/bin/env bash
# Phase-3721: Soft 3720+ honesty surface still complete (hard_gaps_summary_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HARD_GAPS_SUMMARY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3720
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "hard_gaps_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gaps_summary_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3728
print("Soft 3720+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3721 e2e passed"

#!/usr/bin/env bash
# Phase-2265: hard_gap_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gap_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["hard_gap_roster"].startswith(
    "fwbweb.hardGapRoster."
)
assert "hard_gap_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "hard_gap_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "hard_gap_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "hard_gap_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "hard_gap_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 12
assert h.get("soft_fertig_session_storage_clear_key_count") >= 12
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2272
print("hard_gap_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2265 e2e passed"

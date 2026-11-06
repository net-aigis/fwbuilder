#!/usr/bin/env bash
# Phase-4025: hard_gaps_field_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["hard_gaps_field_roster"].startswith("fwbweb.hardGapsFieldRoster.")
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "hard_gaps_field_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "hard_gaps_field_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 34
assert h.get("soft_fertig_session_storage_clear_key_count") >= 34
assert "hardGapsFieldRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("hard_gaps_field_roster") or "")
assert "hardGapsFieldRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("hard_gaps_field_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4032
print("hard_gaps_field_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4025 e2e passed"

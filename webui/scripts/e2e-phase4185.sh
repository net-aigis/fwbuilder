#!/usr/bin/env bash
# Phase-4185: stack_switch_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["stack_switch_roster"].startswith("fwbweb.stackSwitchRoster.")
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "stack_switch_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "stack_switch_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 36
assert h.get("soft_fertig_session_storage_clear_key_count") >= 36
assert "stackSwitchRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("stack_switch_roster") or "")
assert "stackSwitchRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("stack_switch_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4192
print("stack_switch_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4185 e2e passed"

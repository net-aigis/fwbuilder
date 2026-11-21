#!/usr/bin/env bash
# Phase-4265: option_enable_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["option_enable_roster"].startswith("fwbweb.optionEnableRoster.")
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "option_enable_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "option_enable_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 37
assert h.get("soft_fertig_session_storage_clear_key_count") >= 37
assert "optionEnableRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("option_enable_roster") or "")
assert "optionEnableRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("option_enable_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4272
print("option_enable_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4265 e2e passed"

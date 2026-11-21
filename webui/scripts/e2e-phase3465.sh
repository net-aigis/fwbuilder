#!/usr/bin/env bash
# Phase-3465: session_storage_clear_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["session_storage_clear_roster"].startswith(
    "fwbweb.sessionStorageClearRoster."
)
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "session_storage_clear_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "session_storage_clear_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 27
assert h.get("soft_fertig_session_storage_clear_key_count") >= 27
assert "sessionStorageClearRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("session_storage_clear_roster") or ""
)
assert "sessionStorageClearRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("session_storage_clear_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3472
print("session_storage_clear_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3465 e2e passed"

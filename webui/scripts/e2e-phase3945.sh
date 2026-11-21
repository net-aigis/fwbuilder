#!/usr/bin/env bash
# Phase-3945: res_status_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["res_status_roster"].startswith("fwbweb.resStatusRoster.")
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "res_status_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "res_status_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 33
assert h.get("soft_fertig_session_storage_clear_key_count") >= 33
assert "resStatusRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("res_status_roster") or "")
assert "resStatusRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("res_status_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3952
print("res_status_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3945 e2e passed"

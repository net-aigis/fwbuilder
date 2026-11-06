#!/usr/bin/env bash
# Phase-3865: health_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["health_roster"].startswith("fwbweb.healthRoster.")
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "health_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "health_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 32
assert h.get("soft_fertig_session_storage_clear_key_count") >= 32
assert "healthRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("health_roster") or "")
assert "healthRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("health_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3872
print("health_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3865 e2e passed"

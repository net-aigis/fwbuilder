#!/usr/bin/env bash
# Phase-2745: surface_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["surface_roster"].startswith(
    "fwbweb.surfaceRoster."
)
assert "surface_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "surface_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "surface_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "surface_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "surface_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 18
assert h.get("soft_fertig_session_storage_clear_key_count") >= 18
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2752
print("surface_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2745 e2e passed"

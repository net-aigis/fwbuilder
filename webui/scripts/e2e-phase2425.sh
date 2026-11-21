#!/usr/bin/env bash
# Phase-2425: honesty_path_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_path_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["honesty_path_roster"].startswith(
    "fwbweb.honestyPathRoster."
)
assert "honesty_path_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "honesty_path_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "honesty_path_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "honesty_path_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "honesty_path_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 14
assert h.get("soft_fertig_session_storage_clear_key_count") >= 14
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2432
print("honesty_path_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2425 e2e passed"

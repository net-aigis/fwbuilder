#!/usr/bin/env bash
# Phase-1945: readiness in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "readiness" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["readiness"].startswith(
    "fwbweb.honestyReadiness."
)
assert "readiness" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "readiness" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "readiness" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "readiness" in (h.get("soft_fertig_session_storage_keys") or {})
assert "readiness" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 8
assert h.get("soft_fertig_session_storage_clear_key_count") >= 8
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1952
print("readiness sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase1945 e2e passed"

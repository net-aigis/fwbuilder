#!/usr/bin/env bash
# Phase-2985: ssh_honesty_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_honesty_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_honesty_roster"].startswith(
    "fwbweb.sshHonestyRoster."
)
assert "ssh_honesty_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_honesty_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_honesty_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_honesty_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_honesty_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 21
assert h.get("soft_fertig_session_storage_clear_key_count") >= 21
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2992
print("ssh_honesty_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2985 e2e passed"

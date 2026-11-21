#!/usr/bin/env bash
# Phase-6585: ssh_honesty_refresh_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_honesty_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_honesty_refresh_roster"].startswith(
    "fwbweb.sshHonestyRefreshRoster."
)
assert "ssh_honesty_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_honesty_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_honesty_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_honesty_refresh_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_honesty_refresh_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 65
assert h.get('soft_fertig_session_storage_clear_key_count') >= 65
assert "sshHonestyRefreshRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_honesty_refresh_roster") or ""
)
assert "sshHonestyRefreshRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_honesty_refresh_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6592
print("ssh_honesty_refresh_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase6585 e2e passed"

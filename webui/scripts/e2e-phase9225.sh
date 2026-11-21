#!/usr/bin/env bash
# Phase-9225: ssh_auth_bool_flag_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_auth_bool_flag_roster"].startswith(
    "fwbweb.sshAuthBoolFlagRoster."
)
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_auth_bool_flag_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_auth_bool_flag_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 99
assert h.get('soft_fertig_session_storage_clear_key_count') >= 99
assert "sshAuthBoolFlagRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_auth_bool_flag_roster") or ""
)
assert "sshAuthBoolFlagRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_auth_bool_flag_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9240
print("ssh_auth_bool_flag_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase9225 e2e passed"

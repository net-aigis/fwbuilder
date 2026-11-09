#!/usr/bin/env bash
# Phase-20345: ssh_auth_schema_191_echo_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_schema_191_echo_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_auth_schema_191_echo_roster"].startswith(
    "fwbweb.sshAuthSchema191EchoRoster."
)
assert "ssh_auth_schema_191_echo_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_auth_schema_191_echo_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_auth_schema_191_echo_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_auth_schema_191_echo_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_auth_schema_191_echo_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 238
assert h.get('soft_fertig_session_storage_clear_key_count') >= 238
assert "sshAuthSchema191EchoRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_auth_schema_191_echo_roster") or ""
)
assert "sshAuthSchema191EchoRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_auth_schema_191_echo_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20360
print("ssh_auth_schema_191_echo_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase20345 e2e passed"

#!/usr/bin/env bash
# Phase-10665: ssh_auth_empty_check_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_empty_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_auth_empty_check_roster"].startswith(
    "fwbweb.sshAuthEmptyCheckRoster."
)
assert "ssh_auth_empty_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_auth_empty_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_auth_empty_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_auth_empty_check_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_auth_empty_check_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 117
assert h.get('soft_fertig_session_storage_clear_key_count') >= 117
assert "sshAuthEmptyCheckRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_auth_empty_check_roster") or ""
)
assert "sshAuthEmptyCheckRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_auth_empty_check_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10680
print("ssh_auth_empty_check_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase10665 e2e passed"

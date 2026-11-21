#!/usr/bin/env bash
# Phase-5865: ssh_password_support_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_password_support_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_password_support_roster"].startswith(
    "fwbweb.sshPasswordSupportRoster."
)
assert "ssh_password_support_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_password_support_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_password_support_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_password_support_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_password_support_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 57
assert h.get("soft_fertig_session_storage_clear_key_count") >= 57
assert "sshPasswordSupportRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_password_support_roster") or ""
)
assert "sshPasswordSupportRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_password_support_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5872
print("ssh_password_support_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase5865 e2e passed"

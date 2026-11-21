#!/usr/bin/env bash
# Phase-6105: ssh_not_implemented_check_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_not_implemented_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_not_implemented_check_roster"].startswith(
    "fwbweb.sshNotImplementedCheckRoster."
)
assert "ssh_not_implemented_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_not_implemented_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_not_implemented_check_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_not_implemented_check_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_not_implemented_check_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 59
assert h.get('soft_fertig_session_storage_clear_key_count') >= 59
assert "sshNotImplementedCheckRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_not_implemented_check_roster") or ""
)
assert "sshNotImplementedCheckRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_not_implemented_check_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6112
print("ssh_not_implemented_check_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase6105 e2e passed"

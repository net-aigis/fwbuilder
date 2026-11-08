#!/usr/bin/env bash
# Phase-14105: ssh_auth_gap_refusal_title_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_auth_gap_refusal_title_roster"].startswith(
    "fwbweb.sshAuthGapRefusalTitleRoster."
)
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_auth_gap_refusal_title_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_auth_gap_refusal_title_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_auth_gap_refusal_title_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 160
assert h.get('soft_fertig_session_storage_clear_key_count') >= 160
assert "sshAuthGapRefusalTitleRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_auth_gap_refusal_title_roster") or ""
)
assert "sshAuthGapRefusalTitleRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_auth_gap_refusal_title_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14120
print("ssh_auth_gap_refusal_title_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase14105 e2e passed"

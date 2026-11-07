#!/usr/bin/env bash
# Phase-4985: ssh_alternatives_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_alternatives_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_alternatives_roster"].startswith(
    "fwbweb.sshAlternativesRoster."
)
assert "ssh_alternatives_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_alternatives_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_alternatives_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_alternatives_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_alternatives_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 46
assert h.get("soft_fertig_session_storage_clear_key_count") >= 46
assert "sshAlternativesRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_alternatives_roster") or ""
)
assert "sshAlternativesRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_alternatives_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4992
print("ssh_alternatives_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase4985 e2e passed"

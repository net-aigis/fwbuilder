#!/usr/bin/env bash
# Phase-4665: password_ssh_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["password_ssh_roster"].startswith("fwbweb.passwordSshRoster.")
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "password_ssh_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "password_ssh_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 42
assert h.get("soft_fertig_session_storage_clear_key_count") >= 42
assert "passwordSshRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("password_ssh_roster") or "")
assert "passwordSshRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("password_ssh_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4672
print("password_ssh_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4665 e2e passed"

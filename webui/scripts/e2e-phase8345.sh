#!/usr/bin/env bash
# Phase-8345: ssh_implemented_batch_refresh_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_implemented_batch_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_implemented_batch_refresh_roster"].startswith(
    "fwbweb.sshImplementedBatchRefreshRoster."
)
assert "ssh_implemented_batch_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_implemented_batch_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_implemented_batch_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_implemented_batch_refresh_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_implemented_batch_refresh_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 88
assert h.get('soft_fertig_session_storage_clear_key_count') >= 88
assert "sshImplementedBatchRefreshRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_implemented_batch_refresh_roster") or ""
)
assert "sshImplementedBatchRefreshRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_implemented_batch_refresh_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8360
print("ssh_implemented_batch_refresh_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase8345 e2e passed"

#!/usr/bin/env bash
# Phase-6505: ssh_auth_note_snapshot_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_note_snapshot_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["ssh_auth_note_snapshot_roster"].startswith(
    "fwbweb.sshAuthNoteSnapshotRoster."
)
assert "ssh_auth_note_snapshot_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "ssh_auth_note_snapshot_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "ssh_auth_note_snapshot_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "ssh_auth_note_snapshot_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "ssh_auth_note_snapshot_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get('soft_fertig_session_storage_key_count') >= 64
assert h.get('soft_fertig_session_storage_clear_key_count') >= 64
assert "sshAuthNoteSnapshotRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("ssh_auth_note_snapshot_roster") or ""
)
assert "sshAuthNoteSnapshotRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("ssh_auth_note_snapshot_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6512
print("ssh_auth_note_snapshot_roster sessionStorage ok")
PY
echo "cleaned"; echo "OK: phase6505 e2e passed"

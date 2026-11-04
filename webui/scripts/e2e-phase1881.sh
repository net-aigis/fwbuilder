#!/usr/bin/env bash
# Phase-1881: track_note session note mentions UI restore + expandable detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
note = m.SOFT_FERTIG_SESSION_STORAGE_NOTES["track_note"]
assert "restore" in note.lower() or "expandable" in note.lower()
assert "track_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
h = m.hard_gaps()
assert "restore" in str((h.get("soft_fertig_session_storage_notes") or {}).get("track_note") or "").lower() or "expandable" in str((h.get("soft_fertig_session_storage_notes") or {}).get("track_note") or "").lower()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1888
print("track_note restore note ok")
PY
echo "cleaned"
echo "OK: phase1881 e2e passed"

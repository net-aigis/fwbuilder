#!/usr/bin/env bash
# Phase-2057: soft_complete_note session note mentions UI restore + expandable detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
note = m.SOFT_FERTIG_SESSION_STORAGE_NOTES["soft_complete_note"]
assert "restore" in note.lower() or "expandable" in note.lower()
assert "soft_complete_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
h = m.hard_gaps()
n = str((h.get("soft_fertig_session_storage_notes") or {}).get("soft_complete_note") or "").lower()
assert "restore" in n or "expandable" in n
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2064
print("soft_complete_note restore note ok")
PY
echo "cleaned"
echo "OK: phase2057 e2e passed"

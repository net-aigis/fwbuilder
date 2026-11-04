#!/usr/bin/env bash
# Phase-1545: soft_fertig_session_storage_notes on hard-gaps (+ summary/closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_SESSION_STORAGE_NOTES) >= 5
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
notes = h.get("soft_fertig_session_storage_notes") or {}
assert set(notes) == set(m.SOFT_FERTIG_SESSION_STORAGE_KEYS)
assert h.get("soft_fertig_session_storage_notes_count") == len(notes)
assert s.get("soft_fertig_session_storage_notes") == notes
assert s.get("soft_fertig_session_storage_notes_count") == len(notes)
assert c.get("soft_fertig_session_storage_notes") == notes
assert c.get("soft_fertig_session_storage_notes_count") == len(notes)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1552
print("session storage notes", len(notes))
PY
echo "cleaned"
echo "OK: phase1545 e2e passed"

#!/usr/bin/env bash
# Phase-1217: honesty_path_notes on hard-gaps (+ count on summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HONESTY_PATH_NOTES) >= 11
h = m.hard_gaps()
s = m.hard_gaps_summary()
notes = h.get("honesty_path_notes") or {}
assert set(notes) == set(h.get("honesty_paths") or {})
assert h.get("honesty_path_notes_count") == len(notes)
assert s.get("honesty_path_notes_count") == len(notes)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1224
print("honesty_path_notes", len(notes))
PY
echo "cleaned"
echo "OK: phase1217 e2e passed"

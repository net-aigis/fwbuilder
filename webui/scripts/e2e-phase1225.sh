#!/usr/bin/env bash
# Phase-1225: honesty milestone 1950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1950
assert "checkpoint 1950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_path_notes" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1950
assert isinstance(h.get("honesty_path_notes"), dict)
assert int(h.get("honesty_path_notes_count") or 0) >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1232
print("milestone 1950 ok")
PY
echo "cleaned"
echo "OK: phase1225 e2e passed"

#!/usr/bin/env bash
# Phase-1145: honesty milestone 1700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1700
assert "checkpoint 1700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gap_open_labels" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1700
assert isinstance(h.get("hard_gap_open_labels"), dict)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1152
print("milestone 1700 ok")
PY
echo "cleaned"
echo "OK: phase1145 e2e passed"

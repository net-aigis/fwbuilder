#!/usr/bin/env bash
# Phase-3665: honesty milestone 9550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9550
assert "checkpoint 9550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gaps_summary" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3672
print("milestone 9550 ok")
PY
echo "cleaned"
echo "OK: phase3665 e2e passed"

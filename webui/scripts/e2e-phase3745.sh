#!/usr/bin/env bash
# Phase-3745: honesty milestone 9800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9800
assert "checkpoint 9800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gaps_closure" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3752
print("milestone 9800 ok")
PY
echo "cleaned"
echo "OK: phase3745 e2e passed"

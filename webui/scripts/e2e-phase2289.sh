#!/usr/bin/env bash
# Phase-2289: honesty milestone 5250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5250
assert "checkpoint 5250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2280" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2296
print("milestone 5250 ok")
PY
echo "cleaned"
echo "OK: phase2289 e2e passed"

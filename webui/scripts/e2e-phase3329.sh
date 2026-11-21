#!/usr/bin/env bash
# Phase-3329: honesty milestone 8500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8500
assert "checkpoint 8500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3320" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3336
print("milestone 8500 ok")
PY
echo "cleaned"
echo "OK: phase3329 e2e passed"

#!/usr/bin/env bash
# Phase-3617: honesty milestone 9400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9400
assert "checkpoint 9400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.5" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3624
print("milestone 9400 ok")
PY
echo "cleaned"
echo "OK: phase3617 e2e passed"

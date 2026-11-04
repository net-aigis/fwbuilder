#!/usr/bin/env bash
# Phase-897: honesty milestone 1150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 1150
assert "checkpoint 1150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "stack_names" in m.WEBUI_HONESTY_MILESTONE_NOTE or "pages/sections" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") >= 1150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 904
print("milestone 1150 ok")
PY
echo "cleaned"
echo "OK: phase897 e2e passed"

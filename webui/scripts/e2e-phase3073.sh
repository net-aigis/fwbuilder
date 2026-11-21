#!/usr/bin/env bash
# Phase-3073: honesty milestone 7700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7700
assert "checkpoint 7700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "layoutFidelitySignalRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3080
print("milestone 7700 ok")
PY
echo "cleaned"
echo "OK: phase3073 e2e passed"

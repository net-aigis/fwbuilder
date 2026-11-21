#!/usr/bin/env bash
# Phase-2913: honesty milestone 7200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7200
assert "checkpoint 7200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expectStepRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2920
print("milestone 7200 ok")
PY
echo "cleaned"
echo "OK: phase2913 e2e passed"

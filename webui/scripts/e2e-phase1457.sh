#!/usr/bin/env bash
# Phase-1457: honesty milestone 2650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2650
assert "checkpoint 2650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1464
print("milestone 2650 ok")
PY
echo "cleaned"
echo "OK: phase1457 e2e passed"

#!/usr/bin/env bash
# Phase-3697: honesty milestone 9650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9650
assert "checkpoint 9650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.6" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3704
print("milestone 9650 ok")
PY
echo "cleaned"
echo "OK: phase3697 e2e passed"

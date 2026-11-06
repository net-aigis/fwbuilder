#!/usr/bin/env bash
# Phase-3969: honesty milestone 10500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10500
assert "checkpoint 10500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3960" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3976
print("milestone 10500 ok")
PY
echo "cleaned"
echo "OK: phase3969 e2e passed"

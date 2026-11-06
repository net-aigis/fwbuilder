#!/usr/bin/env bash
# Phase-3825: honesty milestone 10050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10050
assert "checkpoint 10050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "health" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3832
print("milestone 10050 ok")
PY
echo "cleaned"
echo "OK: phase3825 e2e passed"

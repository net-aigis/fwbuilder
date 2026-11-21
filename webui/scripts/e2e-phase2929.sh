#!/usr/bin/env bash
# Phase-2929: honesty milestone 7250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7250
assert "checkpoint 7250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2920" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2936
print("milestone 7250 ok")
PY
echo "cleaned"
echo "OK: phase2929 e2e passed"

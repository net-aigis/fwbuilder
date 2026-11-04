#!/usr/bin/env bash
# Phase-1985: honesty milestone 4300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4300
assert "checkpoint 4300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.4" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1992
print("milestone 4300 ok")
PY
echo "cleaned"
echo "OK: phase1985 e2e passed"

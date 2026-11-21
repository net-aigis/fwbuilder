#!/usr/bin/env bash
# Phase-3649: honesty milestone 9500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9500
assert "checkpoint 9500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3640" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3656
print("milestone 9500 ok")
PY
echo "cleaned"
echo "OK: phase3649 e2e passed"

#!/usr/bin/env bash
# Phase-3425: honesty milestone 8800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8800
assert "checkpoint 8800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3432
print("milestone 8800 ok")
PY
echo "cleaned"
echo "OK: phase3425 e2e passed"

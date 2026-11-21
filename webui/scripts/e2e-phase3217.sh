#!/usr/bin/env bash
# Phase-3217: honesty milestone 8150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8150
assert "checkpoint 8150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.0" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3224
print("milestone 8150 ok")
PY
echo "cleaned"
echo "OK: phase3217 e2e passed"

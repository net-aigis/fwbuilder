#!/usr/bin/env bash
# Phase-1393: honesty milestone 2450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2450
assert "checkpoint 2450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1400
print("milestone 2450 ok")
PY
echo "cleaned"
echo "OK: phase1393 e2e passed"

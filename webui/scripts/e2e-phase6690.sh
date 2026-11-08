#!/usr/bin/env bash
# Phase-6690: milestone 19000 on summary + closure + health (tail).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) == 19000
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) == 19000
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) == 19000
assert int(m.health().get("honesty_milestone") or 0) == 19000
print("all endpoints milestone 19000 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6690 e2e passed"

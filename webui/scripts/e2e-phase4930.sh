#!/usr/bin/env bash
# Phase-4930: milestone 13500 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 13500
assert m.hard_gaps_summary().get("honesty_milestone") == 13500
assert m.hard_gap_closure().get("honesty_milestone") == 13500
assert m.health().get("honesty_milestone") == 13500
print("all endpoints milestone 13500 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4930 e2e passed"

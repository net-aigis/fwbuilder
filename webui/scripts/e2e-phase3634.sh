#!/usr/bin/env bash
# Phase-3634: milestone 9450 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 9450
assert m.hard_gaps_summary().get("honesty_milestone") == 9450
assert m.hard_gap_closure().get("honesty_milestone") == 9450
assert m.health().get("honesty_milestone") == 9450
print("all endpoints milestone 9450 ok")
PY
echo "cleaned"
echo "OK: phase3634 e2e passed"

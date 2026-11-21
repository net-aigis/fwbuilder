#!/usr/bin/env bash
# Phase-2578: milestone 6150 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 6150
assert m.hard_gaps_summary().get("honesty_milestone") == 6150
assert m.hard_gap_closure().get("honesty_milestone") == 6150
assert m.health().get("honesty_milestone") == 6150
print("all endpoints milestone 6150 ok")
PY
echo "cleaned"
echo "OK: phase2578 e2e passed"

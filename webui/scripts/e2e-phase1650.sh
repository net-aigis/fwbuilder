#!/usr/bin/env bash
# Phase-1650: milestone 3250 on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3250
assert m.hard_gaps_summary().get("honesty_milestone") == 3250
assert m.hard_gap_closure().get("honesty_milestone") == 3250
print("all endpoints milestone 3250 ok")
PY
echo "cleaned"
echo "OK: phase1650 e2e passed"

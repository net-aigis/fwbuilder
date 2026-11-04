#!/usr/bin/env bash
# Phase-1602: milestone 3100 on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3100
assert m.hard_gaps_summary().get("honesty_milestone") == 3100
assert m.hard_gap_closure().get("honesty_milestone") == 3100
print("all endpoints milestone 3100 ok")
PY
echo "cleaned"
echo "OK: phase1602 e2e passed"

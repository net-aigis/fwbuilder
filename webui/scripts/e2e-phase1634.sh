#!/usr/bin/env bash
# Phase-1634: milestone 3200 on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3200
assert m.hard_gaps_summary().get("honesty_milestone") == 3200
assert m.hard_gap_closure().get("honesty_milestone") == 3200
print("all endpoints milestone 3200 ok")
PY
echo "cleaned"
echo "OK: phase1634 e2e passed"

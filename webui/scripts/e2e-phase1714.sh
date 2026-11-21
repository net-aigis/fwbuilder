#!/usr/bin/env bash
# Phase-1714: milestone 3450 on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3450
assert m.hard_gaps_summary().get("honesty_milestone") == 3450
assert m.hard_gap_closure().get("honesty_milestone") == 3450
print("all endpoints milestone 3450 ok")
PY
echo "cleaned"
echo "OK: phase1714 e2e passed"

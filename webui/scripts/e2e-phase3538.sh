#!/usr/bin/env bash
# Phase-3538: milestone 9150 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 9150
assert m.hard_gaps_summary().get("honesty_milestone") == 9150
assert m.hard_gap_closure().get("honesty_milestone") == 9150
assert m.health().get("honesty_milestone") == 9150
print("all endpoints milestone 9150 ok")
PY
echo "cleaned"
echo "OK: phase3538 e2e passed"

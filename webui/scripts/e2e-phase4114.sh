#!/usr/bin/env bash
# Phase-4114: milestone 10950 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 10950
assert m.hard_gaps_summary().get("honesty_milestone") == 10950
assert m.hard_gap_closure().get("honesty_milestone") == 10950
assert m.health().get("honesty_milestone") == 10950
print("all endpoints milestone 10950 ok")
PY
echo "cleaned"
echo "OK: phase4114 e2e passed"

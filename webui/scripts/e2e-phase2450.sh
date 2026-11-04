#!/usr/bin/env bash
# Phase-2450: milestone 5750 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 5750
assert m.hard_gaps_summary().get("honesty_milestone") == 5750
assert m.hard_gap_closure().get("honesty_milestone") == 5750
assert m.health().get("honesty_milestone") == 5750
print("all endpoints milestone 5750 ok")
PY
echo "cleaned"
echo "OK: phase2450 e2e passed"

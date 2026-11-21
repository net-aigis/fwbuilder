#!/usr/bin/env bash
# Phase-3378: milestone 8650 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 8650
assert m.hard_gaps_summary().get("honesty_milestone") == 8650
assert m.hard_gap_closure().get("honesty_milestone") == 8650
assert m.health().get("honesty_milestone") == 8650
print("all endpoints milestone 8650 ok")
PY
echo "cleaned"
echo "OK: phase3378 e2e passed"

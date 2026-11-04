#!/usr/bin/env bash
# Phase-1938: milestone 4150 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 4150
assert m.hard_gaps_summary().get("honesty_milestone") == 4150
assert m.hard_gap_closure().get("honesty_milestone") == 4150
assert m.health().get("honesty_milestone") == 4150
print("all endpoints milestone 4150 ok")
PY
echo "cleaned"
echo "OK: phase1938 e2e passed"

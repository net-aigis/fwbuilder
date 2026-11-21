#!/usr/bin/env bash
# Phase-2066: milestone 4550 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 4550
assert m.hard_gaps_summary().get("honesty_milestone") == 4550
assert m.hard_gap_closure().get("honesty_milestone") == 4550
assert m.health().get("honesty_milestone") == 4550
print("all endpoints milestone 4550 ok")
PY
echo "cleaned"
echo "OK: phase2066 e2e passed"

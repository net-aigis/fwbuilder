#!/usr/bin/env bash
# Phase-4450: milestone 12000 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 12000
assert m.hard_gaps_summary().get("honesty_milestone") == 12000
assert m.hard_gap_closure().get("honesty_milestone") == 12000
assert m.health().get("honesty_milestone") == 12000
print("all endpoints milestone 12000 ok")
PY
echo "cleaned"
echo "OK: phase4450 e2e passed"

#!/usr/bin/env bash
# Phase-3826: milestone 10050 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 10050
assert m.hard_gaps_summary().get("honesty_milestone") == 10050
assert m.hard_gap_closure().get("honesty_milestone") == 10050
assert m.health().get("honesty_milestone") == 10050
print("all endpoints milestone 10050 ok")
PY
echo "cleaned"
echo "OK: phase3826 e2e passed"

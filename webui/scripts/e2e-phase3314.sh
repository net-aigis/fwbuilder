#!/usr/bin/env bash
# Phase-3314: milestone 8450 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 8450
assert m.hard_gaps_summary().get("honesty_milestone") == 8450
assert m.hard_gap_closure().get("honesty_milestone") == 8450
assert m.health().get("honesty_milestone") == 8450
print("all endpoints milestone 8450 ok")
PY
echo "cleaned"
echo "OK: phase3314 e2e passed"

#!/usr/bin/env bash
# Phase-3090: milestone 7750 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 7750
assert m.hard_gaps_summary().get("honesty_milestone") == 7750
assert m.hard_gap_closure().get("honesty_milestone") == 7750
assert m.health().get("honesty_milestone") == 7750
print("all endpoints milestone 7750 ok")
PY
echo "cleaned"
echo "OK: phase3090 e2e passed"

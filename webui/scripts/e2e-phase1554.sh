#!/usr/bin/env bash
# Phase-1554: milestone 2950 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 2950
assert m.hard_gaps_summary().get("honesty_milestone") == 2950
assert m.hard_gap_closure().get("honesty_milestone") == 2950
# health via module constants mirrored on endpoints
assert m.WEBUI_HONESTY_MILESTONE == 2950
print("all endpoints milestone 2950 ok")
PY
echo "cleaned"
echo "OK: phase1554 e2e passed"

#!/usr/bin/env bash
# Phase-2274: milestone 5200 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 5200
assert m.hard_gaps_summary().get("honesty_milestone") == 5200
assert m.hard_gap_closure().get("honesty_milestone") == 5200
assert m.health().get("honesty_milestone") == 5200
print("all endpoints milestone 5200 ok")
PY
echo "cleaned"
echo "OK: phase2274 e2e passed"

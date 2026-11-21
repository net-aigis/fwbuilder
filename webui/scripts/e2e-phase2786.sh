#!/usr/bin/env bash
# Phase-2786: milestone 6800 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 6800
assert m.hard_gaps_summary().get("honesty_milestone") == 6800
assert m.hard_gap_closure().get("honesty_milestone") == 6800
assert m.health().get("honesty_milestone") == 6800
print("all endpoints milestone 6800 ok")
PY
echo "cleaned"
echo "OK: phase2786 e2e passed"

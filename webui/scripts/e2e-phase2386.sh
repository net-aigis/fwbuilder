#!/usr/bin/env bash
# Phase-2386: milestone 5550 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 5550
assert m.hard_gaps_summary().get("honesty_milestone") == 5550
assert m.hard_gap_closure().get("honesty_milestone") == 5550
assert m.health().get("honesty_milestone") == 5550
print("all endpoints milestone 5550 ok")
PY
echo "cleaned"
echo "OK: phase2386 e2e passed"

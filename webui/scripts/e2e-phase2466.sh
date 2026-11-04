#!/usr/bin/env bash
# Phase-2466: milestone 5800 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 5800
assert m.hard_gaps_summary().get("honesty_milestone") == 5800
assert m.hard_gap_closure().get("honesty_milestone") == 5800
assert m.health().get("honesty_milestone") == 5800
print("all endpoints milestone 5800 ok")
PY
echo "cleaned"
echo "OK: phase2466 e2e passed"

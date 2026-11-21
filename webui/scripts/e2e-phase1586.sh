#!/usr/bin/env bash
# Phase-1586: milestone 3050 on summary + closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3050
assert m.hard_gaps_summary().get("honesty_milestone") == 3050
assert m.hard_gap_closure().get("honesty_milestone") == 3050
print("all endpoints milestone 3050 ok")
PY
echo "cleaned"
echo "OK: phase1586 e2e passed"

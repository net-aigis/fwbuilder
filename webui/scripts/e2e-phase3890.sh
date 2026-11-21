#!/usr/bin/env bash
# Phase-3890: milestone 10250 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 10250
assert m.hard_gaps_summary().get("honesty_milestone") == 10250
assert m.hard_gap_closure().get("honesty_milestone") == 10250
assert m.health().get("honesty_milestone") == 10250
print("all endpoints milestone 10250 ok")
PY
echo "cleaned"
echo "OK: phase3890 e2e passed"

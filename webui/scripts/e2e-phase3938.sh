#!/usr/bin/env bash
# Phase-3938: milestone 10400 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 10400
assert m.hard_gaps_summary().get("honesty_milestone") == 10400
assert m.hard_gap_closure().get("honesty_milestone") == 10400
assert m.health().get("honesty_milestone") == 10400
print("all endpoints milestone 10400 ok")
PY
echo "cleaned"
echo "OK: phase3938 e2e passed"

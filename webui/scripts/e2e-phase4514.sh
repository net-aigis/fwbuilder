#!/usr/bin/env bash
# Phase-4514: milestone 12200 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 12200
assert m.hard_gaps_summary().get("honesty_milestone") == 12200
assert m.hard_gap_closure().get("honesty_milestone") == 12200
assert m.health().get("honesty_milestone") == 12200
print("all endpoints milestone 12200 ok")
PY
echo "cleaned"
echo "OK: phase4514 e2e passed"

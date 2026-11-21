#!/usr/bin/env bash
# Phase-3986: milestone 10550 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 10550
assert m.hard_gaps_summary().get("honesty_milestone") == 10550
assert m.hard_gap_closure().get("honesty_milestone") == 10550
assert m.health().get("honesty_milestone") == 10550
print("all endpoints milestone 10550 ok")
PY
echo "cleaned"
echo "OK: phase3986 e2e passed"

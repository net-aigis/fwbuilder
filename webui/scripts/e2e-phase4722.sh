#!/usr/bin/env bash
# Phase-4722: milestone 12850 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 12850
assert m.hard_gaps_summary().get("honesty_milestone") == 12850
assert m.hard_gap_closure().get("honesty_milestone") == 12850
assert m.health().get("honesty_milestone") == 12850
print("all endpoints milestone 12850 ok")
PY
echo "cleaned"
echo "OK: phase4722 e2e passed"

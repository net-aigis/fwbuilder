#!/usr/bin/env bash
# Phase-5090: milestone 14000 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 14000
assert m.hard_gaps_summary().get("honesty_milestone") == 14000
assert m.hard_gap_closure().get("honesty_milestone") == 14000
assert m.health().get("honesty_milestone") == 14000
print("all endpoints milestone 14000 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5090 e2e passed"

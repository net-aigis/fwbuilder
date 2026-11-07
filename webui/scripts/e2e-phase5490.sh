#!/usr/bin/env bash
# Phase-5490: milestone 15250 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") >= 15250
assert m.hard_gaps_summary().get("honesty_milestone") >= 15250
assert m.hard_gap_closure().get("honesty_milestone") >= 15250
assert m.health().get("honesty_milestone") >= 15250
print("all endpoints milestone 15250 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5490 e2e passed"

#!/usr/bin/env bash
# Phase-6130: milestone 17200 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 17200
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 17200
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 17200
assert int(m.health().get("honesty_milestone") or 0) >= 17200
print("all endpoints milestone 17200 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6130 e2e passed"

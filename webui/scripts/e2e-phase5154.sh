#!/usr/bin/env bash
# Phase-5154: milestone 14200 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 14200
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 14200
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 14200
assert int(m.health().get("honesty_milestone") or 0) >= 14200
print("all endpoints milestone 14200 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5154 e2e passed"

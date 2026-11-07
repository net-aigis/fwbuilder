#!/usr/bin/env bash
# Phase-5474: milestone 15200 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 15200
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 15200
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 15200
assert int(m.health().get("honesty_milestone") or 0) >= 15200
print("all endpoints milestone 15200 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5474 e2e passed"

#!/usr/bin/env bash
# Phase-6482: milestone 18350 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 18350
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 18350
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 18350
assert int(m.health().get("honesty_milestone") or 0) >= 18350
print("all endpoints milestone 18350 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6482 e2e passed"

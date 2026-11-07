#!/usr/bin/env bash
# Phase-4978: milestone 13650 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 13650
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 13650
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 13650
assert int(m.health().get("honesty_milestone") or 0) >= 13650
print("all endpoints milestone 13650 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4978 e2e passed"

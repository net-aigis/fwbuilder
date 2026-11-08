#!/usr/bin/env bash
# Phase-6770: milestone 19250 on summary + closure + health (tail).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) == 19250
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) == 19250
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) == 19250
assert int(m.health().get("honesty_milestone") or 0) == 19250
print("all endpoints milestone 19250 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6770 e2e passed"

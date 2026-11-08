#!/usr/bin/env bash
# Phase-6306: milestone 17800 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 17800
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 17800
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 17800
assert int(m.health().get("honesty_milestone") or 0) >= 17800
print("all endpoints milestone 17800 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6306 e2e passed"

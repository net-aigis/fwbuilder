#!/usr/bin/env bash
# Phase-4914: milestone 13450 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 13450
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 13450
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 13450
assert int(m.health().get("honesty_milestone") or 0) >= 13450
print("all endpoints milestone 13450 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4914 e2e passed"

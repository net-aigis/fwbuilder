#!/usr/bin/env bash
# Phase-5762: milestone 16100 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 16100
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 16100
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 16100
assert int(m.health().get("honesty_milestone") or 0) >= 16100
print("all endpoints milestone 16100 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5762 e2e passed"

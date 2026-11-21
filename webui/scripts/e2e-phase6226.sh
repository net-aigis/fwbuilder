#!/usr/bin/env bash
# Phase-6226: milestone 17550 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 17550
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 17550
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 17550
assert int(m.health().get("honesty_milestone") or 0) >= 17550
print("all endpoints milestone 17550 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6226 e2e passed"

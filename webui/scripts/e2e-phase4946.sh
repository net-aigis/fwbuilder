#!/usr/bin/env bash
# Phase-4946: milestone 13550 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.hard_gaps().get("honesty_milestone") or 0) >= 13550
assert int(m.hard_gaps_summary().get("honesty_milestone") or 0) >= 13550
assert int(m.hard_gap_closure().get("honesty_milestone") or 0) >= 13550
assert int(m.health().get("honesty_milestone") or 0) >= 13550
print("all endpoints milestone 13550 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4946 e2e passed"

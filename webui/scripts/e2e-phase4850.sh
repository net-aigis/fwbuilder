#!/usr/bin/env bash
# Phase-4850: milestone 13250 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 13250
assert m.hard_gaps_summary().get("honesty_milestone") == 13250
assert m.hard_gap_closure().get("honesty_milestone") == 13250
assert m.health().get("honesty_milestone") == 13250
print("all endpoints milestone 13250 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4850 e2e passed"

#!/usr/bin/env bash
# Phase-4370: milestone 11750 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 11750
assert m.hard_gaps_summary().get("honesty_milestone") == 11750
assert m.hard_gap_closure().get("honesty_milestone") == 11750
assert m.health().get("honesty_milestone") == 11750
print("all endpoints milestone 11750 ok")
PY
echo "cleaned"
echo "OK: phase4370 e2e passed"

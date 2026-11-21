#!/usr/bin/env bash
# Phase-1762: milestone 3600 on summary + closure + health.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.hard_gaps().get("honesty_milestone") == 3600
assert m.hard_gaps_summary().get("honesty_milestone") == 3600
assert m.hard_gap_closure().get("honesty_milestone") == 3600
assert m.health().get("honesty_milestone") == 3600
assert m.health().get("soft_fertig_catalog_summary", {}).get("honesty_milestone") == 3600
print("all endpoints milestone 3600 ok")
PY
echo "cleaned"
echo "OK: phase1762 e2e passed"

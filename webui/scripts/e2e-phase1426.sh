#!/usr/bin/env bash
# Phase-1426: all honesty endpoints carry milestone 2550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
for fn in (m.health, m.hard_gaps_summary, m.hard_gap_closure, m.res_status):
    d = fn()
    assert d.get("honesty_milestone") == 2550
    assert "checkpoint 2550" in (d.get("honesty_milestone_note") or "")
print("all endpoints milestone 2550 ok")
PY
echo "cleaned"
echo "OK: phase1426 e2e passed"

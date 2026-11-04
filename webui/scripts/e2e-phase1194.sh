#!/usr/bin/env bash
# Phase-1194: all honesty endpoints carry milestone 1850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
for fn in (m.health, m.hard_gaps_summary, m.hard_gap_closure, m.res_status):
    d = fn()
    assert d.get("honesty_milestone") == 1850
    assert "checkpoint 1850" in (d.get("honesty_milestone_note") or "")
print("all endpoints milestone 1850 ok")
PY
echo "cleaned"
echo "OK: phase1194 e2e passed"

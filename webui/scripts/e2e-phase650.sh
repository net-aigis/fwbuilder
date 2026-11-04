#!/usr/bin/env bash
# Phase-650: health/summary/closure carry milestone note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
for fn in (m.health, m.hard_gaps_summary, m.hard_gap_closure, m.res_status):
    d = fn()
    assert d.get("honesty_milestone") == 650
    assert "checkpoint 650" in (d.get("honesty_milestone_note") or "")
print("all honesty endpoints note ok")
PY
echo "cleaned"
echo "OK: phase650 e2e passed"

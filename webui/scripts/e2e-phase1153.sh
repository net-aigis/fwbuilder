#!/usr/bin/env bash
# Phase-1153: hard_gap_closure_titles on hard-gaps/summary/closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAP_CLOSURE_TITLES) == 3
for fn in (m.hard_gaps, m.hard_gaps_summary, m.hard_gap_closure):
    d = fn()
    titles = d.get("hard_gap_closure_titles") or {}
    assert set(titles) == set(m.HARD_GAPS_OPEN)
    assert all(isinstance(v, str) and v for v in titles.values())
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1160
print("closure_titles ok")
PY
echo "cleaned"
echo "OK: phase1153 e2e passed"

#!/usr/bin/env bash
# Phase-1137: hard_gap_open_labels on hard-gaps/summary/closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAP_LABELS) == 3
for fn in (m.hard_gaps, m.hard_gaps_summary, m.hard_gap_closure):
    d = fn()
    labels = d.get("hard_gap_open_labels") or {}
    assert isinstance(labels, dict)
    assert set(labels) == set(m.HARD_GAPS_OPEN)
    assert all(isinstance(v, str) and v for v in labels.values())
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1144
print("hard_gap_open_labels", m.HARD_GAP_LABELS)
PY
echo "cleaned"
echo "OK: phase1137 e2e passed"

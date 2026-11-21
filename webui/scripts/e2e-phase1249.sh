#!/usr/bin/env bash
# Phase-1249: hard_gap_related_refusals on hard-gaps (+ titles on summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAP_RELATED_REFUSALS) == len(m.HARD_GAPS_OPEN) == 0
h = m.hard_gaps()
s = m.hard_gaps_summary()
refs = h.get("hard_gap_related_refusals") or {}
titles = h.get("hard_gap_related_refusal_titles") or {}
assert set(refs) == set(m.HARD_GAPS_OPEN) == set()
assert set(titles) == set()
assert s.get("hard_gap_related_refusal_titles") == titles
assert h.get("layout_fidelity_pixel_parity") is True
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1256
print("hard_gap_related_refusals", list(refs))
PY
echo "cleaned"
echo "OK: phase1249 e2e passed"

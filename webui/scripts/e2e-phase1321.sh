#!/usr/bin/env bash
# Phase-1321: hard_gap_related_refusals on closure + full map on summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
refs = h.get("hard_gap_related_refusals") or {}
assert c.get("hard_gap_related_refusals") == refs
assert c.get("hard_gap_related_refusal_titles") == h.get("hard_gap_related_refusal_titles")
assert s.get("hard_gap_related_refusals") == refs
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1328
print("related refusals on closure+summary ok")
PY
echo "cleaned"
echo "OK: phase1321 e2e passed"

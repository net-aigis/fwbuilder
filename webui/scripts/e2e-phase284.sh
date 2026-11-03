#!/usr/bin/env bash
# Phase-284: hard_gap_notes + hard_gap_count on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'HARD_GAP_NOTES' webui/backend/fwbweb_api/main.py
grep -Fq 'hard_gap_notes' webui/backend/fwbweb_api/main.py
grep -Fq 'hard_gap_count' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.main import hard_gaps
# call without Depends — invoke underlying logic via module constants
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
assert set(m.HARD_GAP_NOTES)==set(m.HARD_GAPS_OPEN)
print("hard_gap_notes ok", list(m.HARD_GAP_NOTES))
print("cleaned")
PY
echo "OK: phase284 e2e passed"

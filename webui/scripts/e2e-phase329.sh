#!/usr/bin/env bash
# Phase-329: hard_gap_closure criteria on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'HARD_GAP_CLOSURE' webui/backend/fwbweb_api/main.py
grep -Fq 'hard_gap_closure' webui/backend/fwbweb_api/main.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert set(m.HARD_GAP_CLOSURE)==set(m.HARD_GAPS_OPEN)
assert all(len(v)>20 for v in m.HARD_GAP_CLOSURE.values())
print("closure criteria ok", list(m.HARD_GAP_CLOSURE))
print("cleaned")
PY
echo "OK: phase329 e2e passed"

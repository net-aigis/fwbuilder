#!/usr/bin/env bash
# Phase-3303: e2e-all lists 3297-3304; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3297 3298 3299 3300 3301 3302 3303 3304; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3297-3304 ok"
echo "cleaned"
echo "OK: phase3303 e2e passed"

#!/usr/bin/env bash
# Phase-1351: e2e-all lists 1345-1352; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1345 1346 1347 1348 1349 1350 1351 1352; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1345-1352 ok"
echo "cleaned"
echo "OK: phase1351 e2e passed"

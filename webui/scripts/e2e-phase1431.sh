#!/usr/bin/env bash
# Phase-1431: e2e-all lists 1425-1432; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1425 1426 1427 1428 1429 1430 1431 1432; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1425-1432 ok"
echo "cleaned"
echo "OK: phase1431 e2e passed"

#!/usr/bin/env bash
# Phase-3455: e2e-all lists 3449-3456; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3449 3450 3451 3452 3453 3454 3455 3456; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3449-3456 ok"
echo "cleaned"
echo "OK: phase3455 e2e passed"

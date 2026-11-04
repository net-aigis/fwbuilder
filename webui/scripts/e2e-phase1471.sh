#!/usr/bin/env bash
# Phase-1471: e2e-all lists 1465-1472; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1465 1466 1467 1468 1469 1470 1471 1472; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1465-1472 ok"
echo "cleaned"
echo "OK: phase1471 e2e passed"

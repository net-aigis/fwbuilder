#!/usr/bin/env bash
# Phase-1559: e2e-all lists 1553-1560; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1553 1554 1555 1556 1557 1558 1559 1560; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1553-1560 ok"
echo "cleaned"
echo "OK: phase1559 e2e passed"

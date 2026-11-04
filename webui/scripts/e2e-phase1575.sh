#!/usr/bin/env bash
# Phase-1575: e2e-all lists 1569-1576; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1569 1570 1571 1572 1573 1574 1575 1576; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1569-1576 ok"
echo "cleaned"
echo "OK: phase1575 e2e passed"

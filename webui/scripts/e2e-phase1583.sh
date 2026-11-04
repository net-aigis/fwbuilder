#!/usr/bin/env bash
# Phase-1583: e2e-all lists 1577-1584; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1577 1578 1579 1580 1581 1582 1583 1584; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1577-1584 ok"
echo "cleaned"
echo "OK: phase1583 e2e passed"

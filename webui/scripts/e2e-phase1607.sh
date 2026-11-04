#!/usr/bin/env bash
# Phase-1607: e2e-all lists 1601-1608; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1601 1602 1603 1604 1605 1606 1607 1608; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1601-1608 ok"
echo "cleaned"
echo "OK: phase1607 e2e passed"

#!/usr/bin/env bash
# Phase-1527: e2e-all lists 1521-1528; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1521 1522 1523 1524 1525 1526 1527 1528; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1521-1528 ok"
echo "cleaned"
echo "OK: phase1527 e2e passed"

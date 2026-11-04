#!/usr/bin/env bash
# Phase-1567: e2e-all lists 1561-1568; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1561 1562 1563 1564 1565 1566 1567 1568; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1561-1568 ok"
echo "cleaned"
echo "OK: phase1567 e2e passed"

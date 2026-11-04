#!/usr/bin/env bash
# Phase-1519: e2e-all lists 1513-1520; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1513 1514 1515 1516 1517 1518 1519 1520; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1513-1520 ok"
echo "cleaned"
echo "OK: phase1519 e2e passed"

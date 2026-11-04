#!/usr/bin/env bash
# Phase-1455: e2e-all lists 1449-1456; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1449 1450 1451 1452 1453 1454 1455 1456; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1449-1456 ok"
echo "cleaned"
echo "OK: phase1455 e2e passed"

#!/usr/bin/env bash
# Phase-1495: e2e-all lists 1489-1496; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1489 1490 1491 1492 1493 1494 1495 1496; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1489-1496 ok"
echo "cleaned"
echo "OK: phase1495 e2e passed"

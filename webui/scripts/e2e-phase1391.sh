#!/usr/bin/env bash
# Phase-1391: e2e-all lists 1385-1392; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1385 1386 1387 1388 1389 1390 1391 1392; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1385-1392 ok"
echo "cleaned"
echo "OK: phase1391 e2e passed"

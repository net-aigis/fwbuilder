#!/usr/bin/env bash
# Phase-2463: e2e-all lists 2457-2464; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2457 2458 2459 2460 2461 2462 2463 2464; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2457-2464 ok"
echo "cleaned"
echo "OK: phase2463 e2e passed"

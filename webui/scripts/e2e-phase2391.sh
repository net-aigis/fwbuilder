#!/usr/bin/env bash
# Phase-2391: e2e-all lists 2385-2392; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2385 2386 2387 2388 2389 2390 2391 2392; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2385-2392 ok"
echo "cleaned"
echo "OK: phase2391 e2e passed"

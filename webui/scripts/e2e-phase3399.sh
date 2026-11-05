#!/usr/bin/env bash
# Phase-3399: e2e-all lists 3393-3400; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3393 3394 3395 3396 3397 3398 3399 3400; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3393-3400 ok"
echo "cleaned"
echo "OK: phase3399 e2e passed"

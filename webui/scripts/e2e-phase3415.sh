#!/usr/bin/env bash
# Phase-3415: e2e-all lists 3409-3416; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3409 3410 3411 3412 3413 3414 3415 3416; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3409-3416 ok"
echo "cleaned"
echo "OK: phase3415 e2e passed"

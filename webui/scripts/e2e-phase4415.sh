#!/usr/bin/env bash
# Phase-4415: e2e-all lists 4409-4416; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4409 4410 4411 4412 4413 4414 4415 4416; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4409-4416 ok"
echo "cleaned"
echo "OK: phase4415 e2e passed"

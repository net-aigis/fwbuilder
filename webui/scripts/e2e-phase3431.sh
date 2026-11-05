#!/usr/bin/env bash
# Phase-3431: e2e-all lists 3425-3432; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3425 3426 3427 3428 3429 3430 3431 3432; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3425-3432 ok"
echo "cleaned"
echo "OK: phase3431 e2e passed"

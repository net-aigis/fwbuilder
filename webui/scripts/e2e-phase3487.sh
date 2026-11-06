#!/usr/bin/env bash
# Phase-3487: e2e-all lists 3481-3488; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3481 3482 3483 3484 3485 3486 3487 3488; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3481-3488 ok"
echo "cleaned"
echo "OK: phase3487 e2e passed"

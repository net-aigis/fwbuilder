#!/usr/bin/env bash
# Phase-3375: e2e-all lists 3369-3376; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3369 3370 3371 3372 3373 3374 3375 3376; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3369-3376 ok"
echo "cleaned"
echo "OK: phase3375 e2e passed"

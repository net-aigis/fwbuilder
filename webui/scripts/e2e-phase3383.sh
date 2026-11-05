#!/usr/bin/env bash
# Phase-3383: e2e-all lists 3377-3384; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3377 3378 3379 3380 3381 3382 3383 3384; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3377-3384 ok"
echo "cleaned"
echo "OK: phase3383 e2e passed"

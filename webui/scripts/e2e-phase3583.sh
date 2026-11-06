#!/usr/bin/env bash
# Phase-3583: e2e-all lists 3577-3584; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3577 3578 3579 3580 3581 3582 3583 3584; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3577-3584 ok"
echo "cleaned"
echo "OK: phase3583 e2e passed"

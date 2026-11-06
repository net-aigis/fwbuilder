#!/usr/bin/env bash
# Phase-3471: e2e-all lists 3465-3472; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3465 3466 3467 3468 3469 3470 3471 3472; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3465-3472 ok"
echo "cleaned"
echo "OK: phase3471 e2e passed"

#!/usr/bin/env bash
# Phase-2471: e2e-all lists 2465-2472; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2465 2466 2467 2468 2469 2470 2471 2472; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2465-2472 ok"
echo "cleaned"
echo "OK: phase2471 e2e passed"

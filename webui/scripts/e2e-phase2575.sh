#!/usr/bin/env bash
# Phase-2575: e2e-all lists 2569-2576; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2569 2570 2571 2572 2573 2574 2575 2576; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2569-2576 ok"
echo "cleaned"
echo "OK: phase2575 e2e passed"

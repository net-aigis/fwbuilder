#!/usr/bin/env bash
# Phase-2663: e2e-all lists 2657-2664; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2657 2658 2659 2660 2661 2662 2663 2664; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2657-2664 ok"
echo "cleaned"
echo "OK: phase2663 e2e passed"

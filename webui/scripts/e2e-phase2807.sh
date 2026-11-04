#!/usr/bin/env bash
# Phase-2807: e2e-all lists 2801-2808; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2801 2802 2803 2804 2805 2806 2807 2808; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2801-2808 ok"
echo "cleaned"
echo "OK: phase2807 e2e passed"

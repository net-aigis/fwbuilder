#!/usr/bin/env bash
# Phase-3807: e2e-all lists 3801-3808; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3801 3802 3803 3804 3805 3806 3807 3808; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3801-3808 ok"
echo "cleaned"
echo "OK: phase3807 e2e passed"

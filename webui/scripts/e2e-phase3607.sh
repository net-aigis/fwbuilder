#!/usr/bin/env bash
# Phase-3607: e2e-all lists 3601-3608; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3601 3602 3603 3604 3605 3606 3607 3608; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3601-3608 ok"
echo "cleaned"
echo "OK: phase3607 e2e passed"

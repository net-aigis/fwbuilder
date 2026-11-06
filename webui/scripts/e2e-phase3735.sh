#!/usr/bin/env bash
# Phase-3735: e2e-all lists 3729-3736; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3729 3730 3731 3732 3733 3734 3735 3736; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3729-3736 ok"
echo "cleaned"
echo "OK: phase3735 e2e passed"

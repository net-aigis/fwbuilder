#!/usr/bin/env bash
# Phase-2527: e2e-all lists 2521-2528; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2521 2522 2523 2524 2525 2526 2527 2528; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2521-2528 ok"
echo "cleaned"
echo "OK: phase2527 e2e passed"

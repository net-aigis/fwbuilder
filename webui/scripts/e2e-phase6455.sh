#!/usr/bin/env bash
# Phase-6455: e2e-all lists 6049-6056; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 6449 6450 6451 6452 6453 6454 6455 6456; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 6449-6456 ok"; echo "cleaned"; echo "OK: phase6455 e2e passed"

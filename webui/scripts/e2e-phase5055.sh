#!/usr/bin/env bash
# Phase-5055: e2e-all lists 5049-5056; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5049 5050 5051 5052 5053 5054 5055 5056; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5049-5056 ok"; echo "cleaned"; echo "OK: phase5055 e2e passed"

#!/usr/bin/env bash
# Phase-5663: e2e-all lists 5097-5104; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5097 5098 5099 5100 5101 5102 5103 5104; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5097-5104 ok"; echo "cleaned"; echo "OK: phase5663 e2e passed"

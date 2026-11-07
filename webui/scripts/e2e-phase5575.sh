#!/usr/bin/env bash
# Phase-5575: e2e-all lists 5569-5576; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5569 5570 5571 5572 5573 5574 5575 5576; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5569-5576 ok"; echo "cleaned"; echo "OK: phase5575 e2e passed"

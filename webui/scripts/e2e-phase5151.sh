#!/usr/bin/env bash
# Phase-5151: e2e-all lists 5145-5152; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5145 5146 5147 5148 5149 5150 5151 5152; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5145-5152 ok"; echo "cleaned"; echo "OK: phase5151 e2e passed"

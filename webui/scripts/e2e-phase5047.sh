#!/usr/bin/env bash
# Phase-5047: e2e-all lists 5041-5048; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5041 5042 5043 5044 5045 5046 5047 5048; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5041-5048 ok"; echo "cleaned"; echo "OK: phase5047 e2e passed"

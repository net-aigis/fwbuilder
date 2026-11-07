#!/usr/bin/env bash
# Phase-5527: e2e-all lists 5121-5128; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5121 5122 5123 5124 5125 5126 5127 5128; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5121-5128 ok"; echo "cleaned"; echo "OK: phase5527 e2e passed"

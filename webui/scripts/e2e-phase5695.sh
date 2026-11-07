#!/usr/bin/env bash
# Phase-5695: e2e-all lists 5129-5136; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5129 5130 5131 5132 5133 5134 5135 5136; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5129-5136 ok"; echo "cleaned"; echo "OK: phase5695 e2e passed"

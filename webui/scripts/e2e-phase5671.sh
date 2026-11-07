#!/usr/bin/env bash
# Phase-5671: e2e-all lists 5105-5112; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5105 5106 5107 5108 5109 5110 5111 5112; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5105-5112 ok"; echo "cleaned"; echo "OK: phase5671 e2e passed"

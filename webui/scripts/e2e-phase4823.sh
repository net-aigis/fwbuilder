#!/usr/bin/env bash
# Phase-4823: e2e-all lists 4817-4824; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4817 4818 4819 4820 4821 4822 4823 4824; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4817-4824 ok"; echo "cleaned"; echo "OK: phase4823 e2e passed"

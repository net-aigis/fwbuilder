#!/usr/bin/env bash
# Phase-4799: e2e-all lists 4793-4800; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4793 4794 4795 4796 4797 4798 4799 4800; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4793-4800 ok"; echo "cleaned"; echo "OK: phase4799 e2e passed"

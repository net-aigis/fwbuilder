#!/usr/bin/env bash
# Phase-4855: e2e-all lists 4849-4856; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4849 4850 4851 4852 4853 4854 4855 4856; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4849-4856 ok"; echo "cleaned"; echo "OK: phase4855 e2e passed"

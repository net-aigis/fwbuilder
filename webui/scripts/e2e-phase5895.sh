#!/usr/bin/env bash
# Phase-5895: e2e-all lists 5889-5896; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5889 5890 5891 5892 5893 5894 5895 5896; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5889-5896 ok"; echo "cleaned"; echo "OK: phase5895 e2e passed"

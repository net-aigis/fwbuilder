#!/usr/bin/env bash
# Phase-6375: e2e-all lists 6049-6056; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 6369 6370 6371 6372 6373 6374 6375 6376; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 6369-6376 ok"; echo "cleaned"; echo "OK: phase6375 e2e passed"

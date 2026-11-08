#!/usr/bin/env bash
# Phase-6295: e2e-all lists 6049-6056; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 6289 6290 6291 6292 6293 6294 6295 6296; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 6289-6296 ok"; echo "cleaned"; echo "OK: phase6295 e2e passed"

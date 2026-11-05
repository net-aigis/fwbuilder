#!/usr/bin/env bash
# Phase-3295: e2e-all lists 3289-3296; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3289 3290 3291 3292 3293 3294 3295 3296; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3289-3296 ok"
echo "cleaned"
echo "OK: phase3295 e2e passed"

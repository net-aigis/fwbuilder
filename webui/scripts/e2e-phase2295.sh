#!/usr/bin/env bash
# Phase-2295: e2e-all lists 2289-2296; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2289 2290 2291 2292 2293 2294 2295 2296; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2289-2296 ok"
echo "cleaned"
echo "OK: phase2295 e2e passed"

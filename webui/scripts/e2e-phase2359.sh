#!/usr/bin/env bash
# Phase-2359: e2e-all lists 2353-2360; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2353 2354 2355 2356 2357 2358 2359 2360; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2353-2360 ok"
echo "cleaned"
echo "OK: phase2359 e2e passed"

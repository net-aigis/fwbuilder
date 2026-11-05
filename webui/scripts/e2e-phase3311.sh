#!/usr/bin/env bash
# Phase-3311: e2e-all lists 3305-3312; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3305 3306 3307 3308 3309 3310 3311 3312; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3305-3312 ok"
echo "cleaned"
echo "OK: phase3311 e2e passed"

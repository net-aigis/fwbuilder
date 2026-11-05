#!/usr/bin/env bash
# Phase-3279: e2e-all lists 3273-3280; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3273 3274 3275 3276 3277 3278 3279 3280; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3273-3280 ok"
echo "cleaned"
echo "OK: phase3279 e2e passed"

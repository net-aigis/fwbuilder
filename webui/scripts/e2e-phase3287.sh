#!/usr/bin/env bash
# Phase-3287: e2e-all lists 3281-3288; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3281 3282 3283 3284 3285 3286 3287 3288; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3281-3288 ok"
echo "cleaned"
echo "OK: phase3287 e2e passed"

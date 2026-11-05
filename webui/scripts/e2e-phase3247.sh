#!/usr/bin/env bash
# Phase-3247: e2e-all lists 3241-3248; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3241 3242 3243 3244 3245 3246 3247 3248; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3241-3248 ok"
echo "cleaned"
echo "OK: phase3247 e2e passed"

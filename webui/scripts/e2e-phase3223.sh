#!/usr/bin/env bash
# Phase-3223: e2e-all lists 3217-3224; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3217 3218 3219 3220 3221 3222 3223 3224; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3217-3224 ok"
echo "cleaned"
echo "OK: phase3223 e2e passed"

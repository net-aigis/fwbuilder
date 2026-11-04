#!/usr/bin/env bash
# Phase-1223: e2e-all lists 1217-1224; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1217 1218 1219 1220 1221 1222 1223 1224; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1217-1224 ok"
echo "cleaned"
echo "OK: phase1223 e2e passed"

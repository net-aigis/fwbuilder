#!/usr/bin/env bash
# Phase-1271: e2e-all lists 1265-1272; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1265 1266 1267 1268 1269 1270 1271 1272; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1265-1272 ok"
echo "cleaned"
echo "OK: phase1271 e2e passed"

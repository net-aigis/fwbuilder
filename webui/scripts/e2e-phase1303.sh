#!/usr/bin/env bash
# Phase-1303: e2e-all lists 1297-1304; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1297 1298 1299 1300 1301 1302 1303 1304; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1297-1304 ok"
echo "cleaned"
echo "OK: phase1303 e2e passed"

#!/usr/bin/env bash
# Phase-1327: e2e-all lists 1321-1328; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1321 1322 1323 1324 1325 1326 1327 1328; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1321-1328 ok"
echo "cleaned"
echo "OK: phase1327 e2e passed"

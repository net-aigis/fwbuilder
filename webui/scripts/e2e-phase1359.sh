#!/usr/bin/env bash
# Phase-1359: e2e-all lists 1353-1360; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1353 1354 1355 1356 1357 1358 1359 1360; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1353-1360 ok"
echo "cleaned"
echo "OK: phase1359 e2e passed"

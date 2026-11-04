#!/usr/bin/env bash
# Phase-1367: e2e-all lists 1361-1368; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1361 1362 1363 1364 1365 1366 1367 1368; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1361-1368 ok"
echo "cleaned"
echo "OK: phase1367 e2e passed"

#!/usr/bin/env bash
# Phase-1407: e2e-all lists 1401-1408; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1401 1402 1403 1404 1405 1406 1407 1408; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1401-1408 ok"
echo "cleaned"
echo "OK: phase1407 e2e passed"

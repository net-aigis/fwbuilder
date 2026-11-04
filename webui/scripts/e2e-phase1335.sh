#!/usr/bin/env bash
# Phase-1335: e2e-all lists 1329-1336; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1329 1330 1331 1332 1333 1334 1335 1336; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1329-1336 ok"
echo "cleaned"
echo "OK: phase1335 e2e passed"

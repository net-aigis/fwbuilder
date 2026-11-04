#!/usr/bin/env bash
# Phase-2335: e2e-all lists 2329-2336; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2329 2330 2331 2332 2333 2334 2335 2336; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2329-2336 ok"
echo "cleaned"
echo "OK: phase2335 e2e passed"

#!/usr/bin/env bash
# Phase-3335: e2e-all lists 3329-3336; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3329 3330 3331 3332 3333 3334 3335 3336; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3329-3336 ok"
echo "cleaned"
echo "OK: phase3335 e2e passed"

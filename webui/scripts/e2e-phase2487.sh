#!/usr/bin/env bash
# Phase-2487: e2e-all lists 2481-2488; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2481 2482 2483 2484 2485 2486 2487 2488; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2481-2488 ok"
echo "cleaned"
echo "OK: phase2487 e2e passed"

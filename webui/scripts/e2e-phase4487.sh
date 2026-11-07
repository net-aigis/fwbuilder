#!/usr/bin/env bash
# Phase-4487: e2e-all lists 4481-4488; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4481 4482 4483 4484 4485 4486 4487 4488; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4481-4488 ok"
echo "cleaned"
echo "OK: phase4487 e2e passed"

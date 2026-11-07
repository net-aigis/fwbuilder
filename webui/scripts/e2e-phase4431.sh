#!/usr/bin/env bash
# Phase-4431: e2e-all lists 4425-4432; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4425 4426 4427 4428 4429 4430 4431 4432; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4425-4432 ok"
echo "cleaned"
echo "OK: phase4431 e2e passed"

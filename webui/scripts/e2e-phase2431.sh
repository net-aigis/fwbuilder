#!/usr/bin/env bash
# Phase-2431: e2e-all lists 2425-2432; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2425 2426 2427 2428 2429 2430 2431 2432; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2425-2432 ok"
echo "cleaned"
echo "OK: phase2431 e2e passed"

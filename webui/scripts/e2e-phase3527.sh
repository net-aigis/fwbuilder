#!/usr/bin/env bash
# Phase-3527: e2e-all lists 3521-3528; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3521 3522 3523 3524 3525 3526 3527 3528; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3521-3528 ok"
echo "cleaned"
echo "OK: phase3527 e2e passed"

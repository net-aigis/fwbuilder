#!/usr/bin/env bash
# Phase-1511: e2e-all lists 1505-1512; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1505 1506 1507 1508 1509 1510 1511 1512; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1505-1512 ok"
echo "cleaned"
echo "OK: phase1511 e2e passed"

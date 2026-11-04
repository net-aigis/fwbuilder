#!/usr/bin/env bash
# Phase-1543: e2e-all lists 1537-1544; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1537 1538 1539 1540 1541 1542 1543 1544; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1537-1544 ok"
echo "cleaned"
echo "OK: phase1543 e2e passed"

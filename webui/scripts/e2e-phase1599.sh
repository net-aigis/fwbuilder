#!/usr/bin/env bash
# Phase-1599: e2e-all lists 1593-1600; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1593 1594 1595 1596 1597 1598 1599 1600; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1593-1600 ok"
echo "cleaned"
echo "OK: phase1599 e2e passed"

#!/usr/bin/env bash
# Phase-1663: e2e-all lists 1657-1664; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1657 1658 1659 1660 1661 1662 1663 1664; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1657-1664 ok"
echo "cleaned"
echo "OK: phase1663 e2e passed"

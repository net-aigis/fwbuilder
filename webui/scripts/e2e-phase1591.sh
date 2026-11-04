#!/usr/bin/env bash
# Phase-1591: e2e-all lists 1585-1592; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1585 1586 1587 1588 1589 1590 1591 1592; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1585-1592 ok"
echo "cleaned"
echo "OK: phase1591 e2e passed"

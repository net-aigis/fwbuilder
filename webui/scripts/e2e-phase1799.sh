#!/usr/bin/env bash
# Phase-1799: e2e-all lists 1793-1800; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1793 1794 1795 1796 1797 1798 1799 1800; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1793-1800 ok"
echo "cleaned"
echo "OK: phase1799 e2e passed"

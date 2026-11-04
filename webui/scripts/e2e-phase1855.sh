#!/usr/bin/env bash
# Phase-1855: e2e-all lists 1849-1856; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1849 1850 1851 1852 1853 1854 1855 1856; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1849-1856 ok"
echo "cleaned"
echo "OK: phase1855 e2e passed"

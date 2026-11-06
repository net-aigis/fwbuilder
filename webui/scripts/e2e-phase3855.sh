#!/usr/bin/env bash
# Phase-3855: e2e-all lists 3849-3856; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3849 3850 3851 3852 3853 3854 3855 3856; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3849-3856 ok"
echo "cleaned"
echo "OK: phase3855 e2e passed"

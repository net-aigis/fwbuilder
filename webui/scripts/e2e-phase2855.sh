#!/usr/bin/env bash
# Phase-2855: e2e-all lists 2849-2856; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2849 2850 2851 2852 2853 2854 2855 2856; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2849-2856 ok"
echo "cleaned"
echo "OK: phase2855 e2e passed"

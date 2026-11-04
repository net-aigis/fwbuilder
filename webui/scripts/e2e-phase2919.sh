#!/usr/bin/env bash
# Phase-2919: e2e-all lists 2913-2920; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2913 2914 2915 2916 2917 2918 2919 2920; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2913-2920 ok"
echo "cleaned"
echo "OK: phase2919 e2e passed"

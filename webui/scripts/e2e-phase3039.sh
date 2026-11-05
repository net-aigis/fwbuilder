#!/usr/bin/env bash
# Phase-3039: e2e-all lists 3033-3040; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3033 3034 3035 3036 3037 3038 3039 3040; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3033-3040 ok"
echo "cleaned"
echo "OK: phase3039 e2e passed"

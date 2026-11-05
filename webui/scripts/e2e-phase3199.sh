#!/usr/bin/env bash
# Phase-3199: e2e-all lists 3193-3200; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3193 3194 3195 3196 3197 3198 3199 3200; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3193-3200 ok"
echo "cleaned"
echo "OK: phase3199 e2e passed"

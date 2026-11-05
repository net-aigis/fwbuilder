#!/usr/bin/env bash
# Phase-3191: e2e-all lists 3185-3192; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3185 3186 3187 3188 3189 3190 3191 3192; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3185-3192 ok"
echo "cleaned"
echo "OK: phase3191 e2e passed"

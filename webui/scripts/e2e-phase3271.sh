#!/usr/bin/env bash
# Phase-3271: e2e-all lists 3265-3272; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3265 3266 3267 3268 3269 3270 3271 3272; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3265-3272 ok"
echo "cleaned"
echo "OK: phase3271 e2e passed"

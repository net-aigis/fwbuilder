#!/usr/bin/env bash
# Phase-3319: e2e-all lists 3313-3320; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3313 3314 3315 3316 3317 3318 3319 3320; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3313-3320 ok"
echo "cleaned"
echo "OK: phase3319 e2e passed"

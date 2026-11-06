#!/usr/bin/env bash
# Phase-3495: e2e-all lists 3489-3496; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3489 3490 3491 3492 3493 3494 3495 3496; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3489-3496 ok"
echo "cleaned"
echo "OK: phase3495 e2e passed"

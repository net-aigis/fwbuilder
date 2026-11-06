#!/usr/bin/env bash
# Phase-3503: e2e-all lists 3497-3504; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3497 3498 3499 3500 3501 3502 3503 3504; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3497-3504 ok"
echo "cleaned"
echo "OK: phase3503 e2e passed"

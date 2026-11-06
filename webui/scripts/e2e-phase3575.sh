#!/usr/bin/env bash
# Phase-3575: e2e-all lists 3569-3576; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3569 3570 3571 3572 3573 3574 3575 3576; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3569-3576 ok"
echo "cleaned"
echo "OK: phase3575 e2e passed"

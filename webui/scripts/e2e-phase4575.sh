#!/usr/bin/env bash
# Phase-4575: e2e-all lists 4569-4576; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4569 4570 4571 4572 4573 4574 4575 4576; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4569-4576 ok"
echo "cleaned"
echo "OK: phase4575 e2e passed"

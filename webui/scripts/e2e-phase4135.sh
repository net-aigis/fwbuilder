#!/usr/bin/env bash
# Phase-4135: e2e-all lists 4129-4136; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4129 4130 4131 4132 4133 4134 4135 4136; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4129-4136 ok"
echo "cleaned"
echo "OK: phase4135 e2e passed"

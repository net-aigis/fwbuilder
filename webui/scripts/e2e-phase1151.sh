#!/usr/bin/env bash
# Phase-1151: e2e-all lists 1145-1152; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1145 1146 1147 1148 1149 1150 1151 1152; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1145-1152 ok"
echo "cleaned"
echo "OK: phase1151 e2e passed"

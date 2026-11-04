#!/usr/bin/env bash
# Phase-1127: e2e-all lists 1121-1128; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1121 1122 1123 1124 1125 1126 1127 1128; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1121-1128 ok"
echo "cleaned"
echo "OK: phase1127 e2e passed"

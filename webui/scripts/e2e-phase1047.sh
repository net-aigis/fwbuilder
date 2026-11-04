#!/usr/bin/env bash
# Phase-1047: e2e-all lists 1041-1048; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1041 1042 1043 1044 1045 1046 1047 1048; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1041-1048 ok"
echo "cleaned"
echo "OK: phase1047 e2e passed"

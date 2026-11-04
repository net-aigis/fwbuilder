#!/usr/bin/env bash
# Phase-1111: e2e-all lists 1105-1112; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1105 1106 1107 1108 1109 1110 1111 1112; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1105-1112 ok"
echo "cleaned"
echo "OK: phase1111 e2e passed"

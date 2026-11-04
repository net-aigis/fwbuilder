#!/usr/bin/env bash
# Phase-1103: e2e-all lists 1097-1104; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1097 1098 1099 1100 1101 1102 1103 1104; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1097-1104 ok"
echo "cleaned"
echo "OK: phase1103 e2e passed"

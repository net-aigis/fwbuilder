#!/usr/bin/env bash
# Phase-1071: e2e-all lists 1065-1072; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1065 1066 1067 1068 1069 1070 1071 1072; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1065-1072 ok"
echo "cleaned"
echo "OK: phase1071 e2e passed"

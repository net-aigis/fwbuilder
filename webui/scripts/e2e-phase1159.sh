#!/usr/bin/env bash
# Phase-1159: e2e-all lists 1153-1160; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1153 1154 1155 1156 1157 1158 1159 1160; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1153-1160 ok"
echo "cleaned"
echo "OK: phase1159 e2e passed"

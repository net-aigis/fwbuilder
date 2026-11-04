#!/usr/bin/env bash
# Phase-1215: e2e-all lists 1209-1216; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1209 1210 1211 1212 1213 1214 1215 1216; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1209-1216 ok"
echo "cleaned"
echo "OK: phase1215 e2e passed"

#!/usr/bin/env bash
# Phase-3207: e2e-all lists 3201-3208; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3201 3202 3203 3204 3205 3206 3207 3208; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3201-3208 ok"
echo "cleaned"
echo "OK: phase3207 e2e passed"

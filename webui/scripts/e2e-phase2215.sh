#!/usr/bin/env bash
# Phase-2215: e2e-all lists 2209-2216; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2209 2210 2211 2212 2213 2214 2215 2216; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2209-2216 ok"
echo "cleaned"
echo "OK: phase2215 e2e passed"

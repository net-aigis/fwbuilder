#!/usr/bin/env bash
# Phase-2223: e2e-all lists 2217-2224; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2217 2218 2219 2220 2221 2222 2223 2224; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2217-2224 ok"
echo "cleaned"
echo "OK: phase2223 e2e passed"

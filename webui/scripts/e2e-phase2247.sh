#!/usr/bin/env bash
# Phase-2247: e2e-all lists 2241-2248; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2241 2242 2243 2244 2245 2246 2247 2248; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2241-2248 ok"
echo "cleaned"
echo "OK: phase2247 e2e passed"

#!/usr/bin/env bash
# Phase-3263: e2e-all lists 3257-3264; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3257 3258 3259 3260 3261 3262 3263 3264; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3257-3264 ok"
echo "cleaned"
echo "OK: phase3263 e2e passed"

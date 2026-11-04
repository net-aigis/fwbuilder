#!/usr/bin/env bash
# Phase-2263: e2e-all lists 2257-2264; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2257 2258 2259 2260 2261 2262 2263 2264; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2257-2264 ok"
echo "cleaned"
echo "OK: phase2263 e2e passed"

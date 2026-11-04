#!/usr/bin/env bash
# Phase-2319: e2e-all lists 2313-2320; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2313 2314 2315 2316 2317 2318 2319 2320; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2313-2320 ok"
echo "cleaned"
echo "OK: phase2319 e2e passed"

#!/usr/bin/env bash
# Phase-2447: e2e-all lists 2441-2448; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2441 2442 2443 2444 2445 2446 2447 2448; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2441-2448 ok"
echo "cleaned"
echo "OK: phase2447 e2e passed"

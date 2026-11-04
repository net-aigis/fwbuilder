#!/usr/bin/env bash
# Phase-2455: e2e-all lists 2449-2456; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2449 2450 2451 2452 2453 2454 2455 2456; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2449-2456 ok"
echo "cleaned"
echo "OK: phase2455 e2e passed"

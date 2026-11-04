#!/usr/bin/env bash
# Phase-2559: e2e-all lists 2553-2560; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2553 2554 2555 2556 2557 2558 2559 2560; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2553-2560 ok"
echo "cleaned"
echo "OK: phase2559 e2e passed"

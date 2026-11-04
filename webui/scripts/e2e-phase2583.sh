#!/usr/bin/env bash
# Phase-2583: e2e-all lists 2577-2584; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2577 2578 2579 2580 2581 2582 2583 2584; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2577-2584 ok"
echo "cleaned"
echo "OK: phase2583 e2e passed"

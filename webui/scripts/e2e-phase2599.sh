#!/usr/bin/env bash
# Phase-2599: e2e-all lists 2593-2600; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2593 2594 2595 2596 2597 2598 2599 2600; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2593-2600 ok"
echo "cleaned"
echo "OK: phase2599 e2e passed"

#!/usr/bin/env bash
# Phase-3055: e2e-all lists 3049-3056; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3049 3050 3051 3052 3053 3054 3055 3056; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3049-3056 ok"
echo "cleaned"
echo "OK: phase3055 e2e passed"

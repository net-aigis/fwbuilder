#!/usr/bin/env bash
# Phase-3111: e2e-all lists 3105-3112; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3105 3106 3107 3108 3109 3110 3111 3112; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3105-3112 ok"
echo "cleaned"
echo "OK: phase3111 e2e passed"

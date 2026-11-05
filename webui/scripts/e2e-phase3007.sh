#!/usr/bin/env bash
# Phase-3007: e2e-all lists 3001-3008; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3001 3002 3003 3004 3005 3006 3007 3008; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3001-3008 ok"
echo "cleaned"
echo "OK: phase3007 e2e passed"

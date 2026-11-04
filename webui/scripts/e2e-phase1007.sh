#!/usr/bin/env bash
# Phase-1007: e2e-all lists 1001-1008; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1001 1002 1003 1004 1005 1006 1007 1008; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1001-1008 ok"
echo "cleaned"
echo "OK: phase1007 e2e passed"

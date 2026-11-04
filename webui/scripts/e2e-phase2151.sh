#!/usr/bin/env bash
# Phase-2151: e2e-all lists 2145-2152; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2145 2146 2147 2148 2149 2150 2151 2152; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2145-2152 ok"
echo "cleaned"
echo "OK: phase2151 e2e passed"

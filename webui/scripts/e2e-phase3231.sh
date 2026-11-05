#!/usr/bin/env bash
# Phase-3231: e2e-all lists 3225-3232; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3225 3226 3227 3228 3229 3230 3231 3232; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3225-3232 ok"
echo "cleaned"
echo "OK: phase3231 e2e passed"

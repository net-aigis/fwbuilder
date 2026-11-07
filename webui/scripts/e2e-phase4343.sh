#!/usr/bin/env bash
# Phase-4343: e2e-all lists 4337-4344; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4337 4338 4339 4340 4341 4342 4343 4344; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4337-4344 ok"
echo "cleaned"
echo "OK: phase4343 e2e passed"

#!/usr/bin/env bash
# Phase-4351: e2e-all lists 4345-4352; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4345 4346 4347 4348 4349 4350 4351 4352; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4345-4352 ok"
echo "cleaned"
echo "OK: phase4351 e2e passed"

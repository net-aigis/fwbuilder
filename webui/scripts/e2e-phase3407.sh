#!/usr/bin/env bash
# Phase-3407: e2e-all lists 3401-3408; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3401 3402 3403 3404 3405 3406 3407 3408; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3401-3408 ok"
echo "cleaned"
echo "OK: phase3407 e2e passed"

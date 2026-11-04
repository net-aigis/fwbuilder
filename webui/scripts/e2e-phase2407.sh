#!/usr/bin/env bash
# Phase-2407: e2e-all lists 2401-2408; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2401 2402 2403 2404 2405 2406 2407 2408; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2401-2408 ok"
echo "cleaned"
echo "OK: phase2407 e2e passed"

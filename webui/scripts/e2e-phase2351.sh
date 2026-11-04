#!/usr/bin/env bash
# Phase-2351: e2e-all lists 2345-2352; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2345 2346 2347 2348 2349 2350 2351 2352; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2345-2352 ok"
echo "cleaned"
echo "OK: phase2351 e2e passed"

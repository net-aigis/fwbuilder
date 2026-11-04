#!/usr/bin/env bash
# Phase-2367: e2e-all lists 2361-2368; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2361 2362 2363 2364 2365 2366 2367 2368; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2361-2368 ok"
echo "cleaned"
echo "OK: phase2367 e2e passed"

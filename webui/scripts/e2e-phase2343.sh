#!/usr/bin/env bash
# Phase-2343: e2e-all lists 2337-2344; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2337 2338 2339 2340 2341 2342 2343 2344; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2337-2344 ok"
echo "cleaned"
echo "OK: phase2343 e2e passed"

#!/usr/bin/env bash
# Phase-2375: e2e-all lists 2369-2376; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2369 2370 2371 2372 2373 2374 2375 2376; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2369-2376 ok"
echo "cleaned"
echo "OK: phase2375 e2e passed"

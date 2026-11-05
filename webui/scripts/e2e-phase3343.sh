#!/usr/bin/env bash
# Phase-3343: e2e-all lists 3337-3344; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3337 3338 3339 3340 3341 3342 3343 3344; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3337-3344 ok"
echo "cleaned"
echo "OK: phase3343 e2e passed"

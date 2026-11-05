#!/usr/bin/env bash
# Phase-3423: e2e-all lists 3417-3424; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3417 3418 3419 3420 3421 3422 3423 3424; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3417-3424 ok"
echo "cleaned"
echo "OK: phase3423 e2e passed"

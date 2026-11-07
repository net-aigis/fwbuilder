#!/usr/bin/env bash
# Phase-4439: e2e-all lists 4433-4440; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4433 4434 4435 4436 4437 4438 4439 4440; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4433-4440 ok"
echo "cleaned"
echo "OK: phase4439 e2e passed"

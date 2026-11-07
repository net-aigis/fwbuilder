#!/usr/bin/env bash
# Phase-4375: e2e-all lists 4369-4376; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4369 4370 4371 4372 4373 4374 4375 4376; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4369-4376 ok"
echo "cleaned"
echo "OK: phase4375 e2e passed"

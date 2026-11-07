#!/usr/bin/env bash
# Phase-4391: e2e-all lists 4385-4392; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4385 4386 4387 4388 4389 4390 4391 4392; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4385-4392 ok"
echo "cleaned"
echo "OK: phase4391 e2e passed"

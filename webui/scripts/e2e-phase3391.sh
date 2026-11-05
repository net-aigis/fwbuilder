#!/usr/bin/env bash
# Phase-3391: e2e-all lists 3385-3392; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3385 3386 3387 3388 3389 3390 3391 3392; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3385-3392 ok"
echo "cleaned"
echo "OK: phase3391 e2e passed"

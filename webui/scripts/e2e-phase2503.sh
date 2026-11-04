#!/usr/bin/env bash
# Phase-2503: e2e-all lists 2497-2504; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2497 2498 2499 2500 2501 2502 2503 2504; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2497-2504 ok"
echo "cleaned"
echo "OK: phase2503 e2e passed"

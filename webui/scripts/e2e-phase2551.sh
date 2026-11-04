#!/usr/bin/env bash
# Phase-2551: e2e-all lists 2545-2552; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2545 2546 2547 2548 2549 2550 2551 2552; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2545-2552 ok"
echo "cleaned"
echo "OK: phase2551 e2e passed"

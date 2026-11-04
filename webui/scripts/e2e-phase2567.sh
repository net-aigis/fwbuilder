#!/usr/bin/env bash
# Phase-2567: e2e-all lists 2561-2568; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2561 2562 2563 2564 2565 2566 2567 2568; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2561-2568 ok"
echo "cleaned"
echo "OK: phase2567 e2e passed"

#!/usr/bin/env bash
# Phase-2591: e2e-all lists 2585-2592; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2585 2586 2587 2588 2589 2590 2591 2592; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2585-2592 ok"
echo "cleaned"
echo "OK: phase2591 e2e passed"

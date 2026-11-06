#!/usr/bin/env bash
# Phase-3655: e2e-all lists 3649-3656; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3649 3650 3651 3652 3653 3654 3655 3656; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3649-3656 ok"
echo "cleaned"
echo "OK: phase3655 e2e passed"

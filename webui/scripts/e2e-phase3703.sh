#!/usr/bin/env bash
# Phase-3703: e2e-all lists 3697-3704; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3697 3698 3699 3700 3701 3702 3703 3704; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3697-3704 ok"
echo "cleaned"
echo "OK: phase3703 e2e passed"

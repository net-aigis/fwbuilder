#!/usr/bin/env bash
# Phase-3759: e2e-all lists 3753-3760; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3753 3754 3755 3756 3757 3758 3759 3760; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3753-3760 ok"
echo "cleaned"
echo "OK: phase3759 e2e passed"

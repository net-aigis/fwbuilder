#!/usr/bin/env bash
# Phase-4759: e2e-all lists 4753-4760; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4753 4754 4755 4756 4757 4758 4759 4760; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4753-4760 ok"
echo "cleaned"
echo "OK: phase4759 e2e passed"

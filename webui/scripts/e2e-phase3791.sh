#!/usr/bin/env bash
# Phase-3791: e2e-all lists 3785-3792; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3785 3786 3787 3788 3789 3790 3791 3792; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3785-3792 ok"
echo "cleaned"
echo "OK: phase3791 e2e passed"

#!/usr/bin/env bash
# Phase-3783: e2e-all lists 3777-3784; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3777 3778 3779 3780 3781 3782 3783 3784; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3777-3784 ok"
echo "cleaned"
echo "OK: phase3783 e2e passed"

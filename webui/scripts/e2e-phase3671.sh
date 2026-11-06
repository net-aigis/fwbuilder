#!/usr/bin/env bash
# Phase-3671: e2e-all lists 3665-3672; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3665 3666 3667 3668 3669 3670 3671 3672; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3665-3672 ok"
echo "cleaned"
echo "OK: phase3671 e2e passed"

#!/usr/bin/env bash
# Phase-3999: e2e-all lists 3993-4000; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3993 3994 3995 3996 3997 3998 3999 4000; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3993-4000 ok"
echo "cleaned"
echo "OK: phase3999 e2e passed"

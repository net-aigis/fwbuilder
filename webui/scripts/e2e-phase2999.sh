#!/usr/bin/env bash
# Phase-2999: e2e-all lists 2993-3000; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2993 2994 2995 2996 2997 2998 2999 3000; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2993-3000 ok"
echo "cleaned"
echo "OK: phase2999 e2e passed"

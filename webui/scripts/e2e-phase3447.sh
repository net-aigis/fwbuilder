#!/usr/bin/env bash
# Phase-3447: e2e-all lists 3441-3448; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3441 3442 3443 3444 3445 3446 3447 3448; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3441-3448 ok"
echo "cleaned"
echo "OK: phase3447 e2e passed"

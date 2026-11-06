#!/usr/bin/env bash
# Phase-3615: e2e-all lists 3609-3616; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3609 3610 3611 3612 3613 3614 3615 3616; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3609-3616 ok"
echo "cleaned"
echo "OK: phase3615 e2e passed"

#!/usr/bin/env bash
# Phase-4615: e2e-all lists 4609-4616; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4609 4610 4611 4612 4613 4614 4615 4616; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4609-4616 ok"
echo "cleaned"
echo "OK: phase4615 e2e passed"

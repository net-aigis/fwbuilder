#!/usr/bin/env bash
# Phase-2615: e2e-all lists 2609-2616; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2609 2610 2611 2612 2613 2614 2615 2616; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2609-2616 ok"
echo "cleaned"
echo "OK: phase2615 e2e passed"

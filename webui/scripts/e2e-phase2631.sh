#!/usr/bin/env bash
# Phase-2631: e2e-all lists 2625-2632; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2625 2626 2627 2628 2629 2630 2631 2632; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2625-2632 ok"
echo "cleaned"
echo "OK: phase2631 e2e passed"

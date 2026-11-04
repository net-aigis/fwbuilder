#!/usr/bin/env bash
# Phase-2623: e2e-all lists 2617-2624; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2617 2618 2619 2620 2621 2622 2623 2624; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2617-2624 ok"
echo "cleaned"
echo "OK: phase2623 e2e passed"

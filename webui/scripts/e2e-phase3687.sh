#!/usr/bin/env bash
# Phase-3687: e2e-all lists 3681-3688; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3681 3682 3683 3684 3685 3686 3687 3688; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3681-3688 ok"
echo "cleaned"
echo "OK: phase3687 e2e passed"

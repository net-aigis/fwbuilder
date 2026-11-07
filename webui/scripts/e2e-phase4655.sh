#!/usr/bin/env bash
# Phase-4655: e2e-all lists 4649-4656; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4649 4650 4651 4652 4653 4654 4655 4656; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4649-4656 ok"
echo "cleaned"
echo "OK: phase4655 e2e passed"

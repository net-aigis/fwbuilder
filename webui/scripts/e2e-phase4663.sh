#!/usr/bin/env bash
# Phase-4663: e2e-all lists 4657-4664; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4657 4658 4659 4660 4661 4662 4663 4664; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4657-4664 ok"
echo "cleaned"
echo "OK: phase4663 e2e passed"

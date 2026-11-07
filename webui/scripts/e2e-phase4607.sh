#!/usr/bin/env bash
# Phase-4607: e2e-all lists 4601-4608; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4601 4602 4603 4604 4605 4606 4607 4608; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4601-4608 ok"
echo "cleaned"
echo "OK: phase4607 e2e passed"

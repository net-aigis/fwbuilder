#!/usr/bin/env bash
# Phase-4639: e2e-all lists 4633-4640; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4633 4634 4635 4636 4637 4638 4639 4640; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4633-4640 ok"
echo "cleaned"
echo "OK: phase4639 e2e passed"

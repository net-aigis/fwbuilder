#!/usr/bin/env bash
# Phase-4223: e2e-all lists 4217-4224; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4217 4218 4219 4220 4221 4222 4223 4224; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4217-4224 ok"
echo "cleaned"
echo "OK: phase4223 e2e passed"

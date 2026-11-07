#!/usr/bin/env bash
# Phase-4503: e2e-all lists 4497-4504; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4497 4498 4499 4500 4501 4502 4503 4504; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4497-4504 ok"
echo "cleaned"
echo "OK: phase4503 e2e passed"

#!/usr/bin/env bash
# Phase-4567: e2e-all lists 4561-4568; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4561 4562 4563 4564 4565 4566 4567 4568; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4561-4568 ok"
echo "cleaned"
echo "OK: phase4567 e2e passed"

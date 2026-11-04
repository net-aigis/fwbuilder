#!/usr/bin/env bash
# Phase-1503: e2e-all lists 1497-1504; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1497 1498 1499 1500 1501 1502 1503 1504; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1497-1504 ok"
echo "cleaned"
echo "OK: phase1503 e2e passed"

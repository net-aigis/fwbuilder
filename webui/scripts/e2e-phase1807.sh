#!/usr/bin/env bash
# Phase-1807: e2e-all lists 1801-1808; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1801 1802 1803 1804 1805 1806 1807 1808; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1801-1808 ok"
echo "cleaned"
echo "OK: phase1807 e2e passed"

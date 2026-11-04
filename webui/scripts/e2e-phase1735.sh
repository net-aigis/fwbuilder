#!/usr/bin/env bash
# Phase-1735: e2e-all lists 1729-1736; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1729 1730 1731 1732 1733 1734 1735 1736; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1729-1736 ok"
echo "cleaned"
echo "OK: phase1735 e2e passed"

#!/usr/bin/env bash
# Phase-1639: e2e-all lists 1633-1640; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1633 1634 1635 1636 1637 1638 1639 1640; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1633-1640 ok"
echo "cleaned"
echo "OK: phase1639 e2e passed"

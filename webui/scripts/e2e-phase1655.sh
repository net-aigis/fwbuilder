#!/usr/bin/env bash
# Phase-1655: e2e-all lists 1649-1656; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1649 1650 1651 1652 1653 1654 1655 1656; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1649-1656 ok"
echo "cleaned"
echo "OK: phase1655 e2e passed"

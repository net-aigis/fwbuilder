#!/usr/bin/env bash
# Phase-1743: e2e-all lists 1737-1744; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1737 1738 1739 1740 1741 1742 1743 1744; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1737-1744 ok"
echo "cleaned"
echo "OK: phase1743 e2e passed"

#!/usr/bin/env bash
# Phase-1703: e2e-all lists 1697-1704; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1697 1698 1699 1700 1701 1702 1703 1704; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1697-1704 ok"
echo "cleaned"
echo "OK: phase1703 e2e passed"

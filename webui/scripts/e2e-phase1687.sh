#!/usr/bin/env bash
# Phase-1687: e2e-all lists 1681-1688; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1681 1682 1683 1684 1685 1686 1687 1688; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1681-1688 ok"
echo "cleaned"
echo "OK: phase1687 e2e passed"

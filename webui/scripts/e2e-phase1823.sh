#!/usr/bin/env bash
# Phase-1823: e2e-all lists 1817-1824; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1817 1818 1819 1820 1821 1822 1823 1824; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1817-1824 ok"
echo "cleaned"
echo "OK: phase1823 e2e passed"

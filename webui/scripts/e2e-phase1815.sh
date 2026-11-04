#!/usr/bin/env bash
# Phase-1815: e2e-all lists 1809-1816; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1809 1810 1811 1812 1813 1814 1815 1816; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1809-1816 ok"
echo "cleaned"
echo "OK: phase1815 e2e passed"

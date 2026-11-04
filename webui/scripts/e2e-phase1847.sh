#!/usr/bin/env bash
# Phase-1847: e2e-all lists 1841-1848; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1841 1842 1843 1844 1845 1846 1847 1848; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1841-1848 ok"
echo "cleaned"
echo "OK: phase1847 e2e passed"

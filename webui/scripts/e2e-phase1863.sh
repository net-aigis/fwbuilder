#!/usr/bin/env bash
# Phase-1863: e2e-all lists 1857-1864; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1857 1858 1859 1860 1861 1862 1863 1864; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1857-1864 ok"
echo "cleaned"
echo "OK: phase1863 e2e passed"

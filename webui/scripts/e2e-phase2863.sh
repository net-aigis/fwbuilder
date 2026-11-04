#!/usr/bin/env bash
# Phase-2863: e2e-all lists 2857-2864; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2857 2858 2859 2860 2861 2862 2863 2864; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2857-2864 ok"
echo "cleaned"
echo "OK: phase2863 e2e passed"

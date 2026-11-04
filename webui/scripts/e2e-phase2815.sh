#!/usr/bin/env bash
# Phase-2815: e2e-all lists 2809-2816; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2809 2810 2811 2812 2813 2814 2815 2816; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2809-2816 ok"
echo "cleaned"
echo "OK: phase2815 e2e passed"

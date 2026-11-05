#!/usr/bin/env bash
# Phase-3159: e2e-all lists 3153-3160; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3153 3154 3155 3156 3157 3158 3159 3160; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3153-3160 ok"
echo "cleaned"
echo "OK: phase3159 e2e passed"

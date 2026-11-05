#!/usr/bin/env bash
# Phase-3127: e2e-all lists 3121-3128; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3121 3122 3123 3124 3125 3126 3127 3128; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3121-3128 ok"
echo "cleaned"
echo "OK: phase3127 e2e passed"

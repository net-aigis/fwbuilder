#!/usr/bin/env bash
# Phase-3119: e2e-all lists 3113-3120; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3113 3114 3115 3116 3117 3118 3119 3120; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3113-3120 ok"
echo "cleaned"
echo "OK: phase3119 e2e passed"

#!/usr/bin/env bash
# Phase-2135: e2e-all lists 2129-2136; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2129 2130 2131 2132 2133 2134 2135 2136; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2129-2136 ok"
echo "cleaned"
echo "OK: phase2135 e2e passed"

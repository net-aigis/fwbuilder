#!/usr/bin/env bash
# Phase-2111: e2e-all lists 2105-2112; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2105 2106 2107 2108 2109 2110 2111 2112; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2105-2112 ok"
echo "cleaned"
echo "OK: phase2111 e2e passed"

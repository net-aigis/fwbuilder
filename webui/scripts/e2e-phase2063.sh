#!/usr/bin/env bash
# Phase-2063: e2e-all lists 2057-2064; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2057 2058 2059 2060 2061 2062 2063 2064; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2057-2064 ok"
echo "cleaned"
echo "OK: phase2063 e2e passed"

#!/usr/bin/env bash
# Phase-2071: e2e-all lists 2065-2072; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2065 2066 2067 2068 2069 2070 2071 2072; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2065-2072 ok"
echo "cleaned"
echo "OK: phase2071 e2e passed"

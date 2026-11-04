#!/usr/bin/env bash
# Phase-2047: e2e-all lists 2041-2048; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2041 2042 2043 2044 2045 2046 2047 2048; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2041-2048 ok"
echo "cleaned"
echo "OK: phase2047 e2e passed"

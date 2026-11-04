#!/usr/bin/env bash
# Phase-2255: e2e-all lists 2249-2256; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2249 2250 2251 2252 2253 2254 2255 2256; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2249-2256 ok"
echo "cleaned"
echo "OK: phase2255 e2e passed"

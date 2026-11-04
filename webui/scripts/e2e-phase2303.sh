#!/usr/bin/env bash
# Phase-2303: e2e-all lists 2297-2304; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2297 2298 2299 2300 2301 2302 2303 2304; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2297-2304 ok"
echo "cleaned"
echo "OK: phase2303 e2e passed"

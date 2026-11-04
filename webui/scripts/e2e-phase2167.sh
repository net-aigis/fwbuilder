#!/usr/bin/env bash
# Phase-2167: e2e-all lists 2161-2168; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2161 2162 2163 2164 2165 2166 2167 2168; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2161-2168 ok"
echo "cleaned"
echo "OK: phase2167 e2e passed"

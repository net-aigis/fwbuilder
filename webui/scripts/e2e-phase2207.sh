#!/usr/bin/env bash
# Phase-2207: e2e-all lists 2201-2208; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2201 2202 2203 2204 2205 2206 2207 2208; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2201-2208 ok"
echo "cleaned"
echo "OK: phase2207 e2e passed"

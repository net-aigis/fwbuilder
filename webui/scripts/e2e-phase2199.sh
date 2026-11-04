#!/usr/bin/env bash
# Phase-2199: e2e-all lists 2193-2200; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2193 2194 2195 2196 2197 2198 2199 2200; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2193-2200 ok"
echo "cleaned"
echo "OK: phase2199 e2e passed"

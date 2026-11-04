#!/usr/bin/env bash
# Phase-2159: e2e-all lists 2153-2160; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2153 2154 2155 2156 2157 2158 2159 2160; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2153-2160 ok"
echo "cleaned"
echo "OK: phase2159 e2e passed"

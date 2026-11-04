#!/usr/bin/env bash
# Phase-2175: e2e-all lists 2169-2176; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2169 2170 2171 2172 2173 2174 2175 2176; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2169-2176 ok"
echo "cleaned"
echo "OK: phase2175 e2e passed"

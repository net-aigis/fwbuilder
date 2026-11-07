#!/usr/bin/env bash
# Phase-4207: e2e-all lists 4201-4208; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4201 4202 4203 4204 4205 4206 4207 4208; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4201-4208 ok"
echo "cleaned"
echo "OK: phase4207 e2e passed"

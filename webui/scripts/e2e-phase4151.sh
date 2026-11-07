#!/usr/bin/env bash
# Phase-4151: e2e-all lists 4145-4152; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4145 4146 4147 4148 4149 4150 4151 4152; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4145-4152 ok"
echo "cleaned"
echo "OK: phase4151 e2e passed"

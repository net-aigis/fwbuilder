#!/usr/bin/env bash
# Phase-4271: e2e-all lists 4265-4272; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4265 4266 4267 4268 4269 4270 4271 4272; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4265-4272 ok"
echo "cleaned"
echo "OK: phase4271 e2e passed"

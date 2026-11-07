#!/usr/bin/env bash
# Phase-4335: e2e-all lists 4329-4336; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4329 4330 4331 4332 4333 4334 4335 4336; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4329-4336 ok"
echo "cleaned"
echo "OK: phase4335 e2e passed"

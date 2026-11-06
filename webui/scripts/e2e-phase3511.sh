#!/usr/bin/env bash
# Phase-3511: e2e-all lists 3505-3512; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3505 3506 3507 3508 3509 3510 3511 3512; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3505-3512 ok"
echo "cleaned"
echo "OK: phase3511 e2e passed"

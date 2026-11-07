#!/usr/bin/env bash
# Phase-4559: e2e-all lists 4553-4560; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4553 4554 4555 4556 4557 4558 4559 4560; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4553-4560 ok"
echo "cleaned"
echo "OK: phase4559 e2e passed"

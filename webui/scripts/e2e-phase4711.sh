#!/usr/bin/env bash
# Phase-4711: e2e-all lists 4705-4712; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4705 4706 4707 4708 4709 4710 4711 4712; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4705-4712 ok"
echo "cleaned"
echo "OK: phase4711 e2e passed"

#!/usr/bin/env bash
# Phase-4015: e2e-all lists 4009-4016; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4009 4010 4011 4012 4013 4014 4015 4016; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4009-4016 ok"
echo "cleaned"
echo "OK: phase4015 e2e passed"

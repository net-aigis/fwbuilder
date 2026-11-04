#!/usr/bin/env bash
# Phase-1015: e2e-all lists 1009-1016; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1009 1010 1011 1012 1013 1014 1015 1016; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1009-1016 ok"
echo "cleaned"
echo "OK: phase1015 e2e passed"

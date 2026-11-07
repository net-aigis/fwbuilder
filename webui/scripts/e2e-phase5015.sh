#!/usr/bin/env bash
# Phase-5015: e2e-all lists 5009-5016; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5009 5010 5011 5012 5013 5014 5015 5016; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5009-5016 ok"; echo "cleaned"; echo "OK: phase5015 e2e passed"

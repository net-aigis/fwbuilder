#!/usr/bin/env bash
# Phase-5007: e2e-all lists 5001-5008; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5001 5002 5003 5004 5005 5006 5007 5008; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5001-5008 ok"; echo "cleaned"; echo "OK: phase5007 e2e passed"

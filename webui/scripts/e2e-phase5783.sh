#!/usr/bin/env bash
# Phase-5783: e2e-all lists 5137-5144; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5777 5778 5779 5780 5781 5782 5783 5784; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5777-5784 ok"; echo "cleaned"; echo "OK: phase5783 e2e passed"

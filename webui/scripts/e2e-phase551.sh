#!/usr/bin/env bash
# Phase-551: e2e-all lists 545–552 + hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase545' webui/scripts/e2e-all.sh
grep -q 'e2e-phase552' webui/scripts/e2e-all.sh
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "552"
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @ 552")
PY
echo "cleaned"
echo "OK: phase551 e2e passed"

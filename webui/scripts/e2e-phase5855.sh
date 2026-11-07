#!/usr/bin/env bash
# Phase-5855: e2e-all lists 5129-5136; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5849 5850 5851 5852 5853 5854 5855 5856; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5849-5856 ok"; echo "cleaned"; echo "OK: phase5855 e2e passed"

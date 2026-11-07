#!/usr/bin/env bash
# Phase-4927: e2e-all lists 4921-4928; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4921 4922 4923 4924 4925 4926 4927 4928; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4921-4928 ok"; echo "cleaned"; echo "OK: phase4927 e2e passed"

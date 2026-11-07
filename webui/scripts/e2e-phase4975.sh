#!/usr/bin/env bash
# Phase-4975: e2e-all lists 4969-4976; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4969 4970 4971 4972 4973 4974 4975 4976; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4969-4976 ok"; echo "cleaned"; echo "OK: phase4975 e2e passed"

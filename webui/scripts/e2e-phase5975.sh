#!/usr/bin/env bash
# Phase-5975: e2e-all lists 5969-5976; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5969 5970 5971 5972 5973 5974 5975 5976; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5969-5976 ok"; echo "cleaned"; echo "OK: phase5975 e2e passed"

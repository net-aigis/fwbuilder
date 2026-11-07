#!/usr/bin/env bash
# Phase-5247: e2e-all lists 5161-5168; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5161 5162 5163 5164 5165 5166 5167 5168; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5161-5168 ok"; echo "cleaned"; echo "OK: phase5247 e2e passed"

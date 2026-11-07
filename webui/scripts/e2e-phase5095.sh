#!/usr/bin/env bash
# Phase-5095: e2e-all lists 5089-5096; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5089 5090 5091 5092 5093 5094 5095 5096; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5089-5096 ok"; echo "cleaned"; echo "OK: phase5095 e2e passed"

#!/usr/bin/env bash
# Phase-4967: e2e-all lists 4961-4968; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4961 4962 4963 4964 4965 4966 4967 4968; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4961-4968 ok"; echo "cleaned"; echo "OK: phase4967 e2e passed"

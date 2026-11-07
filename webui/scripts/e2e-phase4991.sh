#!/usr/bin/env bash
# Phase-4991: e2e-all lists 4985-4992; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4985 4986 4987 4988 4989 4990 4991 4992; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4985-4992 ok"; echo "cleaned"; echo "OK: phase4991 e2e passed"

#!/usr/bin/env bash
# Phase-4935: e2e-all lists 4929-4936; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4929 4930 4931 4932 4933 4934 4935 4936; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4929-4936 ok"; echo "cleaned"; echo "OK: phase4935 e2e passed"

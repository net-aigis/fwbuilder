#!/usr/bin/env bash
# Phase-4983: e2e-all lists 4977-4984; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4977 4978 4979 4980 4981 4982 4983 4984; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4977-4984 ok"; echo "cleaned"; echo "OK: phase4983 e2e passed"

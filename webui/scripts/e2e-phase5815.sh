#!/usr/bin/env bash
# Phase-5815: e2e-all lists 5809-5816; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5809 5810 5811 5812 5813 5814 5815 5816; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5809-5816 ok"; echo "cleaned"; echo "OK: phase5815 e2e passed"

#!/usr/bin/env bash
# Phase-44855: e2e-all 44849-44856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 44849 44850 44851 44852 44853 44854 44855 44856; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==0
PY
echo OK: phase44855

#!/usr/bin/env bash
# Phase-39735: e2e-all 39729-39736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 39729 39730 39731 39732 39733 39734 39735 39736; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==0
PY
echo OK: phase39735

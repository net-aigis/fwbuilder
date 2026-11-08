#!/usr/bin/env bash
# Phase-8295: e2e-all 8289-8296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 8289 8290 8291 8292 8293 8294 8295 8296; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY
echo OK: phase8295

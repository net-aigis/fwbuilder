#!/usr/bin/env bash
# Phase-18935: e2e-all 18929-18936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 18929 18930 18931 18932 18933 18934 18935 18936; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY
echo OK: phase18935

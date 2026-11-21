#!/usr/bin/env bash
# Phase-47015: e2e-all 47009-47016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 47009 47010 47011 47012 47013 47014 47015 47016; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==0
PY
echo OK: phase47015

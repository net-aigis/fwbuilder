#!/usr/bin/env bash
# Phase-7815: e2e-all 7809-7816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 7809 7810 7811 7812 7813 7814 7815 7816; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY2'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY2
echo OK: phase7815

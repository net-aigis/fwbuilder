#!/usr/bin/env bash
# Phase-32695: e2e-all 32689-32696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 32689 32690 32691 32692 32693 32694 32695 32696; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==0
PY
echo OK: phase32695

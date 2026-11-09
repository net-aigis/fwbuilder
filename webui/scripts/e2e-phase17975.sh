#!/usr/bin/env bash
# Phase-17975: e2e-all 17969-17976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 17969 17970 17971 17972 17973 17974 17975 17976; do grep -Fq e2e-phase${n} webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN)==3
PY
echo OK: phase17975

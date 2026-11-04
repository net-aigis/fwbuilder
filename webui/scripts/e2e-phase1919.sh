#!/usr/bin/env bash
# Phase-1919: e2e-all lists 1913-1920; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1913 1914 1915 1916 1917 1918 1919 1920; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1913-1920 ok"
echo "cleaned"
echo "OK: phase1919 e2e passed"

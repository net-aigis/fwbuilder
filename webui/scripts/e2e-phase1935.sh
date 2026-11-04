#!/usr/bin/env bash
# Phase-1935: e2e-all lists 1929-1936; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1929 1930 1931 1932 1933 1934 1935 1936; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1929-1936 ok"
echo "cleaned"
echo "OK: phase1935 e2e passed"

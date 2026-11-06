#!/usr/bin/env bash
# Phase-3935: e2e-all lists 3929-3936; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3929 3930 3931 3932 3933 3934 3935 3936; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3929-3936 ok"
echo "cleaned"
echo "OK: phase3935 e2e passed"

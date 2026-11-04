#!/usr/bin/env bash
# Phase-1999: e2e-all lists 1993-2000; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1993 1994 1995 1996 1997 1998 1999 2000; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1993-2000 ok"
echo "cleaned"
echo "OK: phase1999 e2e passed"

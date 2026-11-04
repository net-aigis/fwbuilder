#!/usr/bin/env bash
# Phase-1991: e2e-all lists 1985-1992; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1985 1986 1987 1988 1989 1990 1991 1992; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1985-1992 ok"
echo "cleaned"
echo "OK: phase1991 e2e passed"

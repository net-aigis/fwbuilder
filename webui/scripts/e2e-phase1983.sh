#!/usr/bin/env bash
# Phase-1983: e2e-all lists 1977-1984; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1977 1978 1979 1980 1981 1982 1983 1984; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1977-1984 ok"
echo "cleaned"
echo "OK: phase1983 e2e passed"

#!/usr/bin/env bash
# Phase-1975: e2e-all lists 1969-1976; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1969 1970 1971 1972 1973 1974 1975 1976; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1969-1976 ok"
echo "cleaned"
echo "OK: phase1975 e2e passed"

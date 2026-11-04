#!/usr/bin/env bash
# Phase-1967: e2e-all lists 1961-1968; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1961 1962 1963 1964 1965 1966 1967 1968; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1961-1968 ok"
echo "cleaned"
echo "OK: phase1967 e2e passed"

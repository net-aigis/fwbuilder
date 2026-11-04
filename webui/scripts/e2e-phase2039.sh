#!/usr/bin/env bash
# Phase-2039: e2e-all lists 2033-2040; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2033 2034 2035 2036 2037 2038 2039 2040; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2033-2040 ok"
echo "cleaned"
echo "OK: phase2039 e2e passed"

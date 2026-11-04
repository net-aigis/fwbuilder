#!/usr/bin/env bash
# Phase-1039: e2e-all lists 1033-1040; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1033 1034 1035 1036 1037 1038 1039 1040; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1033-1040 ok"
echo "cleaned"
echo "OK: phase1039 e2e passed"

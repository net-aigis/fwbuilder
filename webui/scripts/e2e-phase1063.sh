#!/usr/bin/env bash
# Phase-1063: e2e-all lists 1057-1064; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1057 1058 1059 1060 1061 1062 1063 1064; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1057-1064 ok"
echo "cleaned"
echo "OK: phase1063 e2e passed"

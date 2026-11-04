#!/usr/bin/env bash
# Phase-1079: e2e-all lists 1073-1080; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1073 1074 1075 1076 1077 1078 1079 1080; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1073-1080 ok"
echo "cleaned"
echo "OK: phase1079 e2e passed"

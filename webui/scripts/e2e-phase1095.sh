#!/usr/bin/env bash
# Phase-1095: e2e-all lists 1089-1096; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1089 1090 1091 1092 1093 1094 1095 1096; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1089-1096 ok"
echo "cleaned"
echo "OK: phase1095 e2e passed"

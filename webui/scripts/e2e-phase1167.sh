#!/usr/bin/env bash
# Phase-1167: e2e-all lists 1161-1168; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1161 1162 1163 1164 1165 1166 1167 1168; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1161-1168 ok"
echo "cleaned"
echo "OK: phase1167 e2e passed"

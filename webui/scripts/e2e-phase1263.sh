#!/usr/bin/env bash
# Phase-1263: e2e-all lists 1257-1264; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1257 1258 1259 1260 1261 1262 1263 1264; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1257-1264 ok"
echo "cleaned"
echo "OK: phase1263 e2e passed"

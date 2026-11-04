#!/usr/bin/env bash
# Phase-1311: e2e-all lists 1305-1312; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1305 1306 1307 1308 1309 1310 1311 1312; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1305-1312 ok"
echo "cleaned"
echo "OK: phase1311 e2e passed"

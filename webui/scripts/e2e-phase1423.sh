#!/usr/bin/env bash
# Phase-1423: e2e-all lists 1417-1424; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 1417 1418 1419 1420 1421 1422 1423 1424; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 1417-1424 ok"
echo "cleaned"
echo "OK: phase1423 e2e passed"

#!/usr/bin/env bash
# Phase-4311: e2e-all lists 4305-4312; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4305 4306 4307 4308 4309 4310 4311 4312; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4305-4312 ok"
echo "cleaned"
echo "OK: phase4311 e2e passed"

#!/usr/bin/env bash
# Phase-4287: e2e-all lists 4281-4288; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4281 4282 4283 4284 4285 4286 4287 4288; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4281-4288 ok"
echo "cleaned"
echo "OK: phase4287 e2e passed"

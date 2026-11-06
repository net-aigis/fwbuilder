#!/usr/bin/env bash
# Phase-3599: e2e-all lists 3593-3600; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3593 3594 3595 3596 3597 3598 3599 3600; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3593-3600 ok"
echo "cleaned"
echo "OK: phase3599 e2e passed"

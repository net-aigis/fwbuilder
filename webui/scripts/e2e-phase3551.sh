#!/usr/bin/env bash
# Phase-3551: e2e-all lists 3545-3552; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3545 3546 3547 3548 3549 3550 3551 3552; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3545-3552 ok"
echo "cleaned"
echo "OK: phase3551 e2e passed"

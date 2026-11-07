#!/usr/bin/env bash
# Phase-4671: e2e-all lists 4665-4672; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4665 4666 4667 4668 4669 4670 4671 4672; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4665-4672 ok"
echo "cleaned"
echo "OK: phase4671 e2e passed"

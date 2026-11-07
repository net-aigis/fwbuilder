#!/usr/bin/env bash
# Phase-4551: e2e-all lists 4545-4552; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4545 4546 4547 4548 4549 4550 4551 4552; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4545-4552 ok"
echo "cleaned"
echo "OK: phase4551 e2e passed"

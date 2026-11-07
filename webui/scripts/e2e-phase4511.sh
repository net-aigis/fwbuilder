#!/usr/bin/env bash
# Phase-4511: e2e-all lists 4505-4512; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4505 4506 4507 4508 4509 4510 4511 4512; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4505-4512 ok"
echo "cleaned"
echo "OK: phase4511 e2e passed"

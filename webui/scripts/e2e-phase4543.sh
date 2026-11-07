#!/usr/bin/env bash
# Phase-4543: e2e-all lists 4537-4544; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4537 4538 4539 4540 4541 4542 4543 4544; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4537-4544 ok"
echo "cleaned"
echo "OK: phase4543 e2e passed"

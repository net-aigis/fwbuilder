#!/usr/bin/env bash
# Phase-4495: e2e-all lists 4489-4496; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4489 4490 4491 4492 4493 4494 4495 4496; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4489-4496 ok"
echo "cleaned"
echo "OK: phase4495 e2e passed"

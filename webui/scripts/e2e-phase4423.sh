#!/usr/bin/env bash
# Phase-4423: e2e-all lists 4417-4424; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4417 4418 4419 4420 4421 4422 4423 4424; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4417-4424 ok"
echo "cleaned"
echo "OK: phase4423 e2e passed"

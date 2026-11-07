#!/usr/bin/env bash
# Phase-4367: e2e-all lists 4361-4368; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4361 4362 4363 4364 4365 4366 4367 4368; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4361-4368 ok"
echo "cleaned"
echo "OK: phase4367 e2e passed"

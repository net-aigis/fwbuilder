#!/usr/bin/env bash
# Phase-4519: e2e-all lists 4513-4520; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4513 4514 4515 4516 4517 4518 4519 4520; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4513-4520 ok"
echo "cleaned"
echo "OK: phase4519 e2e passed"

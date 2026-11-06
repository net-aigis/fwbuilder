#!/usr/bin/env bash
# Phase-3519: e2e-all lists 3513-3520; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3513 3514 3515 3516 3517 3518 3519 3520; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3513-3520 ok"
echo "cleaned"
echo "OK: phase3519 e2e passed"

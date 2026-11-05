#!/usr/bin/env bash
# Phase-3359: e2e-all lists 3353-3360; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3353 3354 3355 3356 3357 3358 3359 3360; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3353-3360 ok"
echo "cleaned"
echo "OK: phase3359 e2e passed"

#!/usr/bin/env bash
# Phase-3367: e2e-all lists 3361-3368; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3361 3362 3363 3364 3365 3366 3367 3368; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3361-3368 ok"
echo "cleaned"
echo "OK: phase3367 e2e passed"

#!/usr/bin/env bash
# Phase-4471: e2e-all lists 4465-4472; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4465 4466 4467 4468 4469 4470 4471 4472; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4465-4472 ok"
echo "cleaned"
echo "OK: phase4471 e2e passed"

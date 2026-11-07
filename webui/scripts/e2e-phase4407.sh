#!/usr/bin/env bash
# Phase-4407: e2e-all lists 4401-4408; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4401 4402 4403 4404 4405 4406 4407 4408; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4401-4408 ok"
echo "cleaned"
echo "OK: phase4407 e2e passed"

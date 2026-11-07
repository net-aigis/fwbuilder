#!/usr/bin/env bash
# Phase-4631: e2e-all lists 4625-4632; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4625 4626 4627 4628 4629 4630 4631 4632; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4625-4632 ok"
echo "cleaned"
echo "OK: phase4631 e2e passed"

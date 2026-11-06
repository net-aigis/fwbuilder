#!/usr/bin/env bash
# Phase-3631: e2e-all lists 3625-3632; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3625 3626 3627 3628 3629 3630 3631 3632; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3625-3632 ok"
echo "cleaned"
echo "OK: phase3631 e2e passed"

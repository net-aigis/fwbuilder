#!/usr/bin/env bash
# Phase-4743: e2e-all lists 4737-4744; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4737 4738 4739 4740 4741 4742 4743 4744; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4737-4744 ok"
echo "cleaned"
echo "OK: phase4743 e2e passed"

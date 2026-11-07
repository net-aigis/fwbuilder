#!/usr/bin/env bash
# Phase-4679: e2e-all lists 4673-4680; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4673 4674 4675 4676 4677 4678 4679 4680; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4673-4680 ok"
echo "cleaned"
echo "OK: phase4679 e2e passed"

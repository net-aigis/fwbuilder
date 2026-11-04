#!/usr/bin/env bash
# Phase-2719: e2e-all lists 2713-2720; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2713 2714 2715 2716 2717 2718 2719 2720; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2713-2720 ok"
echo "cleaned"
echo "OK: phase2719 e2e passed"

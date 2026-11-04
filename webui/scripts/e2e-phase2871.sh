#!/usr/bin/env bash
# Phase-2871: e2e-all lists 2865-2872; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2865 2866 2867 2868 2869 2870 2871 2872; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2865-2872 ok"
echo "cleaned"
echo "OK: phase2871 e2e passed"

#!/usr/bin/env bash
# Phase-4871: e2e-all lists 4865-4872; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4865 4866 4867 4868 4869 4870 4871 4872; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4865-4872 ok"; echo "cleaned"; echo "OK: phase4871 e2e passed"

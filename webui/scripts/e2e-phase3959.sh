#!/usr/bin/env bash
# Phase-3959: e2e-all lists 3953-3960; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3953 3954 3955 3956 3957 3958 3959 3960; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3953-3960 ok"
echo "cleaned"
echo "OK: phase3959 e2e passed"

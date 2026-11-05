#!/usr/bin/env bash
# Phase-2975: e2e-all lists 2969-2976; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2969 2970 2971 2972 2973 2974 2975 2976; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2969-2976 ok"
echo "cleaned"
echo "OK: phase2975 e2e passed"

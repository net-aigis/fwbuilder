#!/usr/bin/env bash
# Phase-2959: e2e-all lists 2953-2960; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2953 2954 2955 2956 2957 2958 2959 2960; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2953-2960 ok"
echo "cleaned"
echo "OK: phase2959 e2e passed"

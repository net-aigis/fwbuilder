#!/usr/bin/env bash
# Phase-2943: e2e-all lists 2937-2944; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2937 2938 2939 2940 2941 2942 2943 2944; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2937-2944 ok"
echo "cleaned"
echo "OK: phase2943 e2e passed"

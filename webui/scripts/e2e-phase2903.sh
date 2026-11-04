#!/usr/bin/env bash
# Phase-2903: e2e-all lists 2897-2904; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2897 2898 2899 2900 2901 2902 2903 2904; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2897-2904 ok"
echo "cleaned"
echo "OK: phase2903 e2e passed"

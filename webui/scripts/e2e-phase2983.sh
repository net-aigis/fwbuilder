#!/usr/bin/env bash
# Phase-2983: e2e-all lists 2977-2984; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2977 2978 2979 2980 2981 2982 2983 2984; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2977-2984 ok"
echo "cleaned"
echo "OK: phase2983 e2e passed"

#!/usr/bin/env bash
# Phase-2935: e2e-all lists 2929-2936; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2929 2930 2931 2932 2933 2934 2935 2936; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2929-2936 ok"
echo "cleaned"
echo "OK: phase2935 e2e passed"

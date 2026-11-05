#!/usr/bin/env bash
# Phase-3015: e2e-all lists 3009-3016; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3009 3010 3011 3012 3013 3014 3015 3016; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3009-3016 ok"
echo "cleaned"
echo "OK: phase3015 e2e passed"

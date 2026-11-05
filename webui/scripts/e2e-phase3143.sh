#!/usr/bin/env bash
# Phase-3143: e2e-all lists 3137-3144; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3137 3138 3139 3140 3141 3142 3143 3144; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3137-3144 ok"
echo "cleaned"
echo "OK: phase3143 e2e passed"

#!/usr/bin/env bash
# Phase-3167: e2e-all lists 3161-3168; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3161 3162 3163 3164 3165 3166 3167 3168; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3161-3168 ok"
echo "cleaned"
echo "OK: phase3167 e2e passed"

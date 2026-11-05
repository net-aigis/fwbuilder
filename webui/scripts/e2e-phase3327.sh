#!/usr/bin/env bash
# Phase-3327: e2e-all lists 3321-3328; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3321 3322 3323 3324 3325 3326 3327 3328; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3321-3328 ok"
echo "cleaned"
echo "OK: phase3327 e2e passed"

#!/usr/bin/env bash
# Phase-2231: e2e-all lists 2225-2232; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2225 2226 2227 2228 2229 2230 2231 2232; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2225-2232 ok"
echo "cleaned"
echo "OK: phase2231 e2e passed"

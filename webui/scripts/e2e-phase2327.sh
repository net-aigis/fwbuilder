#!/usr/bin/env bash
# Phase-2327: e2e-all lists 2321-2328; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2321 2322 2323 2324 2325 2326 2327 2328; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2321-2328 ok"
echo "cleaned"
echo "OK: phase2327 e2e passed"

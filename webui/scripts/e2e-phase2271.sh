#!/usr/bin/env bash
# Phase-2271: e2e-all lists 2265-2272; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2265 2266 2267 2268 2269 2270 2271 2272; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2265-2272 ok"
echo "cleaned"
echo "OK: phase2271 e2e passed"

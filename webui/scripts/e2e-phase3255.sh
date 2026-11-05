#!/usr/bin/env bash
# Phase-3255: e2e-all lists 3249-3256; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3249 3250 3251 3252 3253 3254 3255 3256; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3249-3256 ok"
echo "cleaned"
echo "OK: phase3255 e2e passed"

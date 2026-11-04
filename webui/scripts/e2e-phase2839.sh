#!/usr/bin/env bash
# Phase-2839: e2e-all lists 2833-2840; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2833 2834 2835 2836 2837 2838 2839 2840; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2833-2840 ok"
echo "cleaned"
echo "OK: phase2839 e2e passed"

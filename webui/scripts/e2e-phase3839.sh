#!/usr/bin/env bash
# Phase-3839: e2e-all lists 3833-3840; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3833 3834 3835 3836 3837 3838 3839 3840; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3833-3840 ok"
echo "cleaned"
echo "OK: phase3839 e2e passed"

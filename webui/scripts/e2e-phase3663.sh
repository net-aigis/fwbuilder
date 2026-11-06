#!/usr/bin/env bash
# Phase-3663: e2e-all lists 3657-3664; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3657 3658 3659 3660 3661 3662 3663 3664; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3657-3664 ok"
echo "cleaned"
echo "OK: phase3663 e2e passed"

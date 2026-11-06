#!/usr/bin/env bash
# Phase-3815: e2e-all lists 3809-3816; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3809 3810 3811 3812 3813 3814 3815 3816; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3809-3816 ok"
echo "cleaned"
echo "OK: phase3815 e2e passed"

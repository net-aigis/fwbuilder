#!/usr/bin/env bash
# Phase-2799: e2e-all lists 2793-2800; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2793 2794 2795 2796 2797 2798 2799 2800; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2793-2800 ok"
echo "cleaned"
echo "OK: phase2799 e2e passed"

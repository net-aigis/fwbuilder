#!/usr/bin/env bash
# Phase-2927: e2e-all lists 2921-2928; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2921 2922 2923 2924 2925 2926 2927 2928; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2921-2928 ok"
echo "cleaned"
echo "OK: phase2927 e2e passed"

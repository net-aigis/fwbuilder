#!/usr/bin/env bash
# Phase-3903: e2e-all lists 3897-3904; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3897 3898 3899 3900 3901 3902 3903 3904; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3897-3904 ok"
echo "cleaned"
echo "OK: phase3903 e2e passed"

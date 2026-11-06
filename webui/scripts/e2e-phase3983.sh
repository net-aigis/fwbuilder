#!/usr/bin/env bash
# Phase-3983: e2e-all lists 3977-3984; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3977 3978 3979 3980 3981 3982 3983 3984; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3977-3984 ok"
echo "cleaned"
echo "OK: phase3983 e2e passed"

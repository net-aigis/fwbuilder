#!/usr/bin/env bash
# Phase-4143: e2e-all lists 4137-4144; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4137 4138 4139 4140 4141 4142 4143 4144; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4137-4144 ok"
echo "cleaned"
echo "OK: phase4143 e2e passed"

#!/usr/bin/env bash
# Phase-4175: e2e-all lists 4169-4176; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4169 4170 4171 4172 4173 4174 4175 4176; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4169-4176 ok"
echo "cleaned"
echo "OK: phase4175 e2e passed"

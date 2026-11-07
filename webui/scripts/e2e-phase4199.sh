#!/usr/bin/env bash
# Phase-4199: e2e-all lists 4193-4200; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4193 4194 4195 4196 4197 4198 4199 4200; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4193-4200 ok"
echo "cleaned"
echo "OK: phase4199 e2e passed"

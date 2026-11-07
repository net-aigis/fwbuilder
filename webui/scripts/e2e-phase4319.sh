#!/usr/bin/env bash
# Phase-4319: e2e-all lists 4313-4320; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4313 4314 4315 4316 4317 4318 4319 4320; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4313-4320 ok"
echo "cleaned"
echo "OK: phase4319 e2e passed"

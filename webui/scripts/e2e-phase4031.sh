#!/usr/bin/env bash
# Phase-4031: e2e-all lists 4025-4032; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4025 4026 4027 4028 4029 4030 4031 4032; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4025-4032 ok"
echo "cleaned"
echo "OK: phase4031 e2e passed"

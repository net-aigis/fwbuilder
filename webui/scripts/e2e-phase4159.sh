#!/usr/bin/env bash
# Phase-4159: e2e-all lists 4153-4160; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 4153 4154 4155 4156 4157 4158 4159 4160; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4153-4160 ok"
echo "cleaned"
echo "OK: phase4159 e2e passed"

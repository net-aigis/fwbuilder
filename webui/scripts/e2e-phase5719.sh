#!/usr/bin/env bash
# Phase-5719: e2e-all lists 5153-5160; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5153 5154 5155 5156 5157 5158 5159 5160; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5153-5160 ok"; echo "cleaned"; echo "OK: phase5719 e2e passed"

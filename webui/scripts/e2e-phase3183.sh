#!/usr/bin/env bash
# Phase-3183: e2e-all lists 3177-3184; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3177 3178 3179 3180 3181 3182 3183 3184; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3177-3184 ok"
echo "cleaned"
echo "OK: phase3183 e2e passed"

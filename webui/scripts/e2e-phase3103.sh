#!/usr/bin/env bash
# Phase-3103: e2e-all lists 3097-3104; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 3097 3098 3099 3100 3101 3102 3103 3104; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 3097-3104 ok"
echo "cleaned"
echo "OK: phase3103 e2e passed"

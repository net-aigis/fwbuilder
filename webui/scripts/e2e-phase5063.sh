#!/usr/bin/env bash
# Phase-5063: e2e-all lists 5057-5064; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5057 5058 5059 5060 5061 5062 5063 5064; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5057-5064 ok"; echo "cleaned"; echo "OK: phase5063 e2e passed"

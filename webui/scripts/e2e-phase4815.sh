#!/usr/bin/env bash
# Phase-4815: e2e-all lists 4809-4816; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4809 4810 4811 4812 4813 4814 4815 4816; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4809-4816 ok"; echo "cleaned"; echo "OK: phase4815 e2e passed"

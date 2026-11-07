#!/usr/bin/env bash
# Phase-5599: e2e-all lists 5113-5120; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5113 5114 5115 5116 5117 5118 5119 5120; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5113-5120 ok"; echo "cleaned"; echo "OK: phase5599 e2e passed"

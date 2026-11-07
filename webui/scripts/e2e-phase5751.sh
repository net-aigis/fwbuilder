#!/usr/bin/env bash
# Phase-5751: e2e-all lists 5105-5112; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5745 5746 5747 5748 5749 5750 5751 5752; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5745-5752 ok"; echo "cleaned"; echo "OK: phase5751 e2e passed"

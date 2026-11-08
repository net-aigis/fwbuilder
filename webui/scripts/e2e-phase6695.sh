#!/usr/bin/env bash
# Phase-6695: e2e-all lists 6689-6696; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 6689 6690 6691 6692 6693 6694 6695 6696; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 6689-6696 ok"; echo "cleaned"; echo "OK: phase6695 e2e passed"

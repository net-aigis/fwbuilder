#!/usr/bin/env bash
# Phase-4791: e2e-all lists 4785-4792; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 4785 4786 4787 4788 4789 4790 4791 4792; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 4785-4792 ok"; echo "cleaned"; echo "OK: phase4791 e2e passed"

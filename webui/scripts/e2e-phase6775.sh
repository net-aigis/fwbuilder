#!/usr/bin/env bash
# Phase-6775: e2e-all lists 6769-6776; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 6769 6770 6771 6772 6773 6774 6775 6776; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 6769-6776 ok"; echo "cleaned"; echo "OK: phase6775 e2e passed"

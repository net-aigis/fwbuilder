#!/usr/bin/env bash
# Phase-5071: e2e-all lists 5065-5072; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5065 5066 5067 5068 5069 5070 5071 5072; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5065-5072 ok"; echo "cleaned"; echo "OK: phase5071 e2e passed"

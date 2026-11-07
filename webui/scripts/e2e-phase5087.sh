#!/usr/bin/env bash
# Phase-5087: e2e-all lists 5081-5088; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
for n in 5081 5082 5083 5084 5085 5086 5087 5088; do grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh; done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 5081-5088 ok"; echo "cleaned"; echo "OK: phase5087 e2e passed"

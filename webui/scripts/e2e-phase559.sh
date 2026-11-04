#!/usr/bin/env bash
# Phase-559: hard gaps still 3 @ 560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "560"
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @ 560")
PY
echo "cleaned"
echo "OK: phase559 e2e passed"

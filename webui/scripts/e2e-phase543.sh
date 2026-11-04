#!/usr/bin/env bash
# Phase-543: hard gaps still 3 @ 544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "544"
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @ 544")
PY
echo "cleaned"
echo "OK: phase543 e2e passed"

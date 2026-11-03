#!/usr/bin/env bash
# Phase-341: hard gaps still 3 @ 344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE=="344"
assert len(m.HARD_GAPS_OPEN)==3
print("hard gaps still 3 @ 344")
print("cleaned")
PY
echo "OK: phase341 e2e passed"

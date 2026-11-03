#!/usr/bin/env bash
# Phase-334: hard gaps still 3 with closure map.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE=="336"
assert len(m.HARD_GAPS_OPEN)==3
assert len(m.HARD_GAP_CLOSURE)==3
print("hard gaps+closure @ 336 ok")
print("cleaned")
PY
echo "OK: phase334 e2e passed"

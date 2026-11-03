#!/usr/bin/env bash
# Phase-325: hard gaps unchanged at 328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE=="328"
assert len(m.HARD_GAPS_OPEN)==3
print("hard gaps still 3 @ 328")
print("cleaned")
PY
echo "OK: phase325 e2e passed"

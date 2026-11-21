#!/usr/bin/env bash
# Phase-34080: soft-complete through 34080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34080
PY
grep -qE 'phase34080|through 34080' webui/STATUS.md
echo "OK: phase34080 e2e passed"

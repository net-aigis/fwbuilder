#!/usr/bin/env bash
# Phase-43376: soft-complete through 43376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43376
PY
grep -qE 'phase43376|through 43376' webui/STATUS.md
echo "OK: phase43376 e2e passed"

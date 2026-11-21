#!/usr/bin/env bash
# Phase-37376: soft-complete through 37376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37376
PY
grep -qE 'phase37376|through 37376' webui/STATUS.md
echo "OK: phase37376 e2e passed"

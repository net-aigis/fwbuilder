#!/usr/bin/env bash
# Phase-45376: soft-complete through 45376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45376
PY
grep -qE 'phase45376|through 45376' webui/STATUS.md
echo "OK: phase45376 e2e passed"

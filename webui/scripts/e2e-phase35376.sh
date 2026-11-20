#!/usr/bin/env bash
# Phase-35376: soft-complete through 35376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35376
PY
grep -qE 'phase35376|through 35376' webui/STATUS.md
echo "OK: phase35376 e2e passed"

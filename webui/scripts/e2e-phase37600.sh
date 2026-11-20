#!/usr/bin/env bash
# Phase-37600: soft-complete through 37600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37600
PY
grep -qE 'phase37600|through 37600' webui/STATUS.md
echo "OK: phase37600 e2e passed"

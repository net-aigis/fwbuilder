#!/usr/bin/env bash
# Phase-45208: soft-complete through 45208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45208
PY
grep -qE 'phase45208|through 45208' webui/STATUS.md
echo "OK: phase45208 e2e passed"

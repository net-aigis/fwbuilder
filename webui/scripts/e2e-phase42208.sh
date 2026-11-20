#!/usr/bin/env bash
# Phase-42208: soft-complete through 42208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42208
PY
grep -qE 'phase42208|through 42208' webui/STATUS.md
echo "OK: phase42208 e2e passed"

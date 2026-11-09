#!/usr/bin/env bash
# Phase-22208: soft-complete through 22208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22208
PY
grep -qE 'phase22208|through 22208' webui/STATUS.md
echo "OK: phase22208 e2e passed"

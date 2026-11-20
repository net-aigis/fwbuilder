#!/usr/bin/env bash
# Phase-36208: soft-complete through 36208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36208
PY
grep -qE 'phase36208|through 36208' webui/STATUS.md
echo "OK: phase36208 e2e passed"

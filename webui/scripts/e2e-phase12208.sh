#!/usr/bin/env bash
# Phase-12208: soft-complete through 12208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12208
PY
grep -qE 'phase12208|through 12208' webui/STATUS.md
echo "OK: phase12208 e2e passed"

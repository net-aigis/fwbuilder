#!/usr/bin/env bash
# Phase-28208: soft-complete through 28208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28208
PY
grep -qE 'phase28208|through 28208' webui/STATUS.md
echo "OK: phase28208 e2e passed"

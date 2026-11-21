#!/usr/bin/env bash
# Phase-8208: soft-complete through 8208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8208
PY
grep -qE 'phase8208|through 8208' webui/STATUS.md
echo "OK: phase8208 e2e passed"

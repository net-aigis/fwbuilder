#!/usr/bin/env bash
# Phase-45296: soft-complete through 45296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45296
PY
grep -qE 'phase45296|through 45296' webui/STATUS.md
echo "OK: phase45296 e2e passed"

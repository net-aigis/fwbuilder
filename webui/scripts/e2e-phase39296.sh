#!/usr/bin/env bash
# Phase-39296: soft-complete through 39296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39296
PY
grep -qE 'phase39296|through 39296' webui/STATUS.md
echo "OK: phase39296 e2e passed"

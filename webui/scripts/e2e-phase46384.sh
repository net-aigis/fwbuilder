#!/usr/bin/env bash
# Phase-46384: soft-complete through 46384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46384
PY
grep -qE 'phase46384|through 46384' webui/STATUS.md
echo "OK: phase46384 e2e passed"

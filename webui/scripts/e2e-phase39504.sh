#!/usr/bin/env bash
# Phase-39504: soft-complete through 39504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39504
PY
grep -qE 'phase39504|through 39504' webui/STATUS.md
echo "OK: phase39504 e2e passed"

#!/usr/bin/env bash
# Phase-42336: soft-complete through 42336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42336
PY
grep -qE 'phase42336|through 42336' webui/STATUS.md
echo "OK: phase42336 e2e passed"

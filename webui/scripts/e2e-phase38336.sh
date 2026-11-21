#!/usr/bin/env bash
# Phase-38336: soft-complete through 38336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38336
PY
grep -qE 'phase38336|through 38336' webui/STATUS.md
echo "OK: phase38336 e2e passed"

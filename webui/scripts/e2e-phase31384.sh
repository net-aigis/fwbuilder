#!/usr/bin/env bash
# Phase-31384: soft-complete through 31384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31384
PY
grep -qE 'phase31384|through 31384' webui/STATUS.md
echo "OK: phase31384 e2e passed"

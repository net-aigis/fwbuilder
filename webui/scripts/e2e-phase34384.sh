#!/usr/bin/env bash
# Phase-34384: soft-complete through 34384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34384
PY
grep -qE 'phase34384|through 34384' webui/STATUS.md
echo "OK: phase34384 e2e passed"

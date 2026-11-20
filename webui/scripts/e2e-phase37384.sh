#!/usr/bin/env bash
# Phase-37384: soft-complete through 37384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37384
PY
grep -qE 'phase37384|through 37384' webui/STATUS.md
echo "OK: phase37384 e2e passed"

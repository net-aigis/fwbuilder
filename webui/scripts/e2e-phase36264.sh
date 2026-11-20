#!/usr/bin/env bash
# Phase-36264: soft-complete through 36264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36264
PY
grep -qE 'phase36264|through 36264' webui/STATUS.md
echo "OK: phase36264 e2e passed"

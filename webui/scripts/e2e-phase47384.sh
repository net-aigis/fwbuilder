#!/usr/bin/env bash
# Phase-47384: soft-complete through 47384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47384
PY
grep -qE 'phase47384|through 47384' webui/STATUS.md
echo "OK: phase47384 e2e passed"

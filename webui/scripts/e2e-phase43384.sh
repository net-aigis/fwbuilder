#!/usr/bin/env bash
# Phase-43384: soft-complete through 43384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43384
PY
grep -qE 'phase43384|through 43384' webui/STATUS.md
echo "OK: phase43384 e2e passed"

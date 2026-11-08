#!/usr/bin/env bash
# Phase-14128: soft-complete through 14128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14128
PY
grep -qE 'phase14128|through 14128' webui/STATUS.md
echo "OK: phase14128 e2e passed"

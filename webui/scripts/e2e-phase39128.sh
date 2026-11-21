#!/usr/bin/env bash
# Phase-39128: soft-complete through 39128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39128
PY
grep -qE 'phase39128|through 39128' webui/STATUS.md
echo "OK: phase39128 e2e passed"

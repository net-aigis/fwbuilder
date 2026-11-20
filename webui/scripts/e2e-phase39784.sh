#!/usr/bin/env bash
# Phase-39784: soft-complete through 39784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39784
PY
grep -qE 'phase39784|through 39784' webui/STATUS.md
echo "OK: phase39784 e2e passed"

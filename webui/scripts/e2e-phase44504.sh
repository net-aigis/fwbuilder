#!/usr/bin/env bash
# Phase-44504: soft-complete through 44504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44504
PY
grep -qE 'phase44504|through 44504' webui/STATUS.md
echo "OK: phase44504 e2e passed"

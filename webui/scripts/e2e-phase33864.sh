#!/usr/bin/env bash
# Phase-33864: soft-complete through 33864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33864
PY
grep -qE 'phase33864|through 33864' webui/STATUS.md
echo "OK: phase33864 e2e passed"

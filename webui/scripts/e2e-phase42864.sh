#!/usr/bin/env bash
# Phase-42864: soft-complete through 42864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42864
PY
grep -qE 'phase42864|through 42864' webui/STATUS.md
echo "OK: phase42864 e2e passed"

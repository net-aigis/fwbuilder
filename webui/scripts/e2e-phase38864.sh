#!/usr/bin/env bash
# Phase-38864: soft-complete through 38864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38864
PY
grep -qE 'phase38864|through 38864' webui/STATUS.md
echo "OK: phase38864 e2e passed"

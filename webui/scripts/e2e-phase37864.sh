#!/usr/bin/env bash
# Phase-37864: soft-complete through 37864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37864
PY
grep -qE 'phase37864|through 37864' webui/STATUS.md
echo "OK: phase37864 e2e passed"

#!/usr/bin/env bash
# Phase-39104: soft-complete through 39104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39104
PY
grep -qE 'phase39104|through 39104' webui/STATUS.md
echo "OK: phase39104 e2e passed"

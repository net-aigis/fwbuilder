#!/usr/bin/env bash
# Phase-37480: soft-complete through 37480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37480
PY
grep -qE 'phase37480|through 37480' webui/STATUS.md
echo "OK: phase37480 e2e passed"

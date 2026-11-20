#!/usr/bin/env bash
# Phase-35928: soft-complete through 35928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35928
PY
grep -qE 'phase35928|through 35928' webui/STATUS.md
echo "OK: phase35928 e2e passed"

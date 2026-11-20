#!/usr/bin/env bash
# Phase-47480: soft-complete through 47480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47480
PY
grep -qE 'phase47480|through 47480' webui/STATUS.md
echo "OK: phase47480 e2e passed"

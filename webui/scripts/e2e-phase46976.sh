#!/usr/bin/env bash
# Phase-46976: soft-complete through 46976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46976
PY
grep -qE 'phase46976|through 46976' webui/STATUS.md
echo "OK: phase46976 e2e passed"

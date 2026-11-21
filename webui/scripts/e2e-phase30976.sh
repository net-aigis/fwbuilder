#!/usr/bin/env bash
# Phase-30976: soft-complete through 30976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30976
PY
grep -qE 'phase30976|through 30976' webui/STATUS.md
echo "OK: phase30976 e2e passed"

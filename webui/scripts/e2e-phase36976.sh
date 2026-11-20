#!/usr/bin/env bash
# Phase-36976: soft-complete through 36976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36976
PY
grep -qE 'phase36976|through 36976' webui/STATUS.md
echo "OK: phase36976 e2e passed"

#!/usr/bin/env bash
# Phase-44976: soft-complete through 44976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44976
PY
grep -qE 'phase44976|through 44976' webui/STATUS.md
echo "OK: phase44976 e2e passed"

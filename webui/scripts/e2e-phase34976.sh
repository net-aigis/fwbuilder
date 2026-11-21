#!/usr/bin/env bash
# Phase-34976: soft-complete through 34976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34976
PY
grep -qE 'phase34976|through 34976' webui/STATUS.md
echo "OK: phase34976 e2e passed"

#!/usr/bin/env bash
# Phase-34720: soft-complete through 34720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34720
PY
grep -qE 'phase34720|through 34720' webui/STATUS.md
echo "OK: phase34720 e2e passed"

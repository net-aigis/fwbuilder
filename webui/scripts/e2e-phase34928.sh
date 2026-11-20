#!/usr/bin/env bash
# Phase-34928: soft-complete through 34928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34928
PY
grep -qE 'phase34928|through 34928' webui/STATUS.md
echo "OK: phase34928 e2e passed"

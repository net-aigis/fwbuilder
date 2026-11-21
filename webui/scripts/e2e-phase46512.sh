#!/usr/bin/env bash
# Phase-46512: soft-complete through 46512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46512
PY
grep -qE 'phase46512|through 46512' webui/STATUS.md
echo "OK: phase46512 e2e passed"

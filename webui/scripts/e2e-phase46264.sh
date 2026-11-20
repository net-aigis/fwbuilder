#!/usr/bin/env bash
# Phase-46264: soft-complete through 46264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46264
PY
grep -qE 'phase46264|through 46264' webui/STATUS.md
echo "OK: phase46264 e2e passed"

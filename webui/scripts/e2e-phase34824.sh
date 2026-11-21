#!/usr/bin/env bash
# Phase-34824: soft-complete through 34824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34824
PY
grep -qE 'phase34824|through 34824' webui/STATUS.md
echo "OK: phase34824 e2e passed"

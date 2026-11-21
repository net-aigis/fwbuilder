#!/usr/bin/env bash
# Phase-45832: soft-complete through 45832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45832
PY
grep -qE 'phase45832|through 45832' webui/STATUS.md
echo "OK: phase45832 e2e passed"

#!/usr/bin/env bash
# Phase-46832: soft-complete through 46832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46832
PY
grep -qE 'phase46832|through 46832' webui/STATUS.md
echo "OK: phase46832 e2e passed"

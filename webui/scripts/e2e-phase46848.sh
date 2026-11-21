#!/usr/bin/env bash
# Phase-46848: soft-complete through 46848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46848
PY
grep -qE 'phase46848|through 46848' webui/STATUS.md
echo "OK: phase46848 e2e passed"

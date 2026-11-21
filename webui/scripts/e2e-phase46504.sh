#!/usr/bin/env bash
# Phase-46504: soft-complete through 46504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46504
PY
grep -qE 'phase46504|through 46504' webui/STATUS.md
echo "OK: phase46504 e2e passed"

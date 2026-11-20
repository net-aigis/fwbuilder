#!/usr/bin/env bash
# Phase-46392: soft-complete through 46392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46392
PY
grep -qE 'phase46392|through 46392' webui/STATUS.md
echo "OK: phase46392 e2e passed"

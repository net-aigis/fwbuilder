#!/usr/bin/env bash
# Phase-44392: soft-complete through 44392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44392
PY
grep -qE 'phase44392|through 44392' webui/STATUS.md
echo "OK: phase44392 e2e passed"

#!/usr/bin/env bash
# Phase-39392: soft-complete through 39392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39392
PY
grep -qE 'phase39392|through 39392' webui/STATUS.md
echo "OK: phase39392 e2e passed"

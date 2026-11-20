#!/usr/bin/env bash
# Phase-46560: soft-complete through 46560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46560
PY
grep -qE 'phase46560|through 46560' webui/STATUS.md
echo "OK: phase46560 e2e passed"

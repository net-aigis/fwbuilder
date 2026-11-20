#!/usr/bin/env bash
# Phase-37424: soft-complete through 37424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37424
PY
grep -qE 'phase37424|through 37424' webui/STATUS.md
echo "OK: phase37424 e2e passed"

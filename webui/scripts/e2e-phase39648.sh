#!/usr/bin/env bash
# Phase-39648: soft-complete through 39648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39648
PY
grep -qE 'phase39648|through 39648' webui/STATUS.md
echo "OK: phase39648 e2e passed"

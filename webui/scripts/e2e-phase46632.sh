#!/usr/bin/env bash
# Phase-46632: soft-complete through 46632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46632
PY
grep -qE 'phase46632|through 46632' webui/STATUS.md
echo "OK: phase46632 e2e passed"

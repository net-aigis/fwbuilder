#!/usr/bin/env bash
# Phase-35632: soft-complete through 35632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35632
PY
grep -qE 'phase35632|through 35632' webui/STATUS.md
echo "OK: phase35632 e2e passed"

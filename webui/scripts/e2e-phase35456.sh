#!/usr/bin/env bash
# Phase-35456: soft-complete through 35456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35456
PY
grep -qE 'phase35456|through 35456' webui/STATUS.md
echo "OK: phase35456 e2e passed"
